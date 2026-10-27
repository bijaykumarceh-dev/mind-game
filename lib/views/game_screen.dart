import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_constants.dart';
import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../models/interaction_type.dart';
import '../models/puzzle_category.dart';
import '../models/puzzle_level.dart';
import '../repositories/level_repository.dart';
import '../services/ad_service.dart';
import '../services/audio_service.dart';
import '../viewmodels/game_viewmodel.dart';
import '../viewmodels/user_progress_viewmodel.dart';
import '../widgets/confetti.dart';

class GameScreen extends StatelessWidget {
  final int levelId;

  const GameScreen({super.key, required this.levelId});

  @override
  Widget build(BuildContext context) {
    final level = context.read<LevelRepository>().getLevelById(levelId);
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(
        level: level,
        userProgressVM: context.read<UserProgressViewModel>(),
        adService: context.read<AdService>(),
        audio: context.read<AudioService>(),
      ),
      child: _GameView(level: level),
    );
  }
}

class _GameView extends StatelessWidget {
  final PuzzleLevel level;

  const _GameView({required this.level});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameViewModel>();
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    final isHindi = progress.languageCode == 'hi';

    return Scaffold(
      appBar: AppBar(
        title: Text('${text.translate('level')} ${level.id}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(
              child: Text(
                '🪙 ${progress.coins}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            key: const Key('hint_button'),
            tooltip: text.translate('hint'),
            icon: const Icon(Icons.lightbulb_outline_rounded),
            onPressed: game.hintsRevealedCount >= game.maxHints
                ? null
                : () => _showHint(context, game, progress),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: game.state == GameState.completed
                  ? _CompletionPanel(level: level)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearProgressIndicator(
                          value: level.id / AppConstants.totalLevels,
                          minHeight: 5,
                          borderRadius: BorderRadius.circular(5),
                          backgroundColor: AppTheme.surfaceColor,
                        ),
                        if (game.hasTimer)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  size: 20,
                                  color: game.secondsLeft <= 3
                                      ? AppTheme.accentColor
                                      : AppTheme.secondaryColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${text.translate('time_left')}: ${game.secondsLeft}s',
                                  key: const Key('timer_label'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: game.secondsLeft <= 3
                                        ? AppTheme.accentColor
                                        : Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              level.category.icon,
                              size: 16,
                              color: AppTheme.secondaryColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isHindi
                                  ? level.category.nameHi
                                  : level.category.nameEn,
                              style: const TextStyle(
                                color: AppTheme.secondaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          level.getQuestion(progress.languageCode),
                          key: const Key('puzzle_question'),
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          level.getInstruction(progress.languageCode),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (game.state == GameState.wrongAnswer)
                          _WrongAnswerBanner(
                            message: text.translate('wrong_answer'),
                            onRetry: game.retryLevel,
                          ),
                        const SizedBox(height: 18),
                        Expanded(child: _InteractionPanel(level: level)),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showHint(
    BuildContext context,
    GameViewModel game,
    UserProgressViewModel progress,
  ) async {
    final text = AppLocalizations.of(context);
    if (game.hintsRevealedCount >= game.maxHints) {
      return;
    }
    if (progress.hintsInventory == 0) {
      final adService = context.read<AdService>();
      var completed = false;
      adService.showRewardedAd(
        onRewarded: (_) {
          completed = true;
          progress.addHints(1);
          game.revealNextHint();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  level.getHints(
                    progress.languageCode,
                  )[game.hintsRevealedCount - 1],
                ),
              ),
            );
          }
        },
        onAdClosedOrFailed: () {
          if (!completed && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(text.translate('ad_unavailable'))),
            );
          }
        },
      );
      return;
    }
    final index = game.hintsRevealedCount;
    game.revealNextHint();
    if (game.hintsRevealedCount > index && context.mounted) {
      await showDialog<void>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text('${text.translate('hint')} ${index + 1}'),
          content: Text(level.getHints(progress.languageCode)[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(
                MaterialLocalizations.of(dialogContext).okButtonLabel,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _InteractionPanel extends StatelessWidget {
  final PuzzleLevel level;

  const _InteractionPanel({required this.level});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameViewModel>();
    final language = context.watch<UserProgressViewModel>().languageCode;
    final options = level.getOptions(language);
    final text = AppLocalizations.of(context);

    switch (level.interactionType) {
      case InteractionType.multipleChoice:
        return _ChoiceGrid(
          labels: options ?? const [],
          onSelected: game.selectMultipleChoice,
        );
      case InteractionType.tap:
        if (level.targetSequence != null) {
          final maxValue = level.targetSequence!.fold<int>(
            0,
            (maximum, value) => math.max(maximum, value),
          );
          final count = math.max(
            (level.extraData?['itemsCount'] as num?)?.toInt() ?? 0,
            maxValue + 1,
          );
          return _SequenceGrid(
            count: count,
            sequence: game.tapSequence,
            onTap: game.addTapIndex,
            onReset: game.resetTaps,
          );
        }
        final labels =
            options ??
            List.generate(
              (level.extraData?['itemsCount'] as num?)?.toInt() ?? 4,
              (index) => '${text.translate('option')} ${index + 1}',
            );
        return _ChoiceGrid(labels: labels, onSelected: game.addTapIndex);
      case InteractionType.dragDrop:
        return _DragPuzzle(level: level);
      case InteractionType.positioning:
        return _PositionPuzzle(level: level);
      case InteractionType.multiStep:
        return _MultiStepPuzzle(level: level);
      case InteractionType.patternObservation:
        if (options != null && options.isNotEmpty) {
          return _ChoiceGrid(
            labels: options,
            onSelected: game.selectMultipleChoice,
          );
        }
        return _TextAnswerPuzzle(onSubmit: game.submitTextAnswer);
      case InteractionType.timedMemory:
        return _MemoryPuzzle(level: level);
    }
  }
}

class _ChoiceGrid extends StatelessWidget {
  final List<String> labels;
  final ValueChanged<int> onSelected;

  const _ChoiceGrid({required this.labels, required this.onSelected});

  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: labels.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.8,
    ),
    itemBuilder: (context, index) => ElevatedButton(
      key: Key('answer_$index'),
      onPressed: () => onSelected(index),
      child: Text(labels[index], textAlign: TextAlign.center),
    ),
  );
}

class _SequenceGrid extends StatelessWidget {
  final int count;
  final List<int> sequence;
  final ValueChanged<int> onTap;
  final VoidCallback onReset;

  const _SequenceGrid({
    required this.count,
    required this.sequence,
    required this.onTap,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        '${AppLocalizations.of(context).translate('sequence')}: '
        '${sequence.map((value) => value + 1).join('  →  ')}',
      ),
      const SizedBox(height: 12),
      Expanded(
        child: GridView.builder(
          itemCount: count,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => ElevatedButton(
            onPressed: () => onTap(index),
            child: Text('${index + 1}', style: const TextStyle(fontSize: 22)),
          ),
        ),
      ),
      TextButton.icon(
        onPressed: onReset,
        icon: const Icon(Icons.refresh),
        label: Text(AppLocalizations.of(context).translate('reset')),
      ),
    ],
  );
}

class _DragPuzzle extends StatelessWidget {
  final PuzzleLevel level;

  const _DragPuzzle({required this.level});

  @override
  Widget build(BuildContext context) {
    final source = level.dragSourceId ?? 'object';
    final target = level.dragTargetId ?? 'target';
    final game = context.read<GameViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Draggable<String>(
          data: source,
          feedback: Material(
            color: Colors.transparent,
            child: _PuzzleToken(label: _humanize(source)),
          ),
          childWhenDragging: Opacity(
            opacity: .3,
            child: _PuzzleToken(label: _humanize(source)),
          ),
          child: _PuzzleToken(label: _humanize(source)),
        ),
        const SizedBox(height: 28),
        DragTarget<String>(
          onAcceptWithDetails: (details) =>
              game.setDragDrop(details.data, target),
          builder: (context, candidates, rejected) => AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: candidates.isNotEmpty
                  ? AppTheme.successColor.withValues(alpha: .25)
                  : AppTheme.surfaceColor,
              border: Border.all(
                color: candidates.isNotEmpty
                    ? AppTheme.successColor
                    : Colors.white24,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(
                '${AppLocalizations.of(context).translate('drop_on')} ${_humanize(target)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _humanize(String value) => value
      .split('_')
      .map(
        (part) => part.isEmpty
            ? part
            : '${part[0].toUpperCase()}${part.substring(1)}',
      )
      .join(' ');
}

class _PuzzleToken extends StatelessWidget {
  final String label;

  const _PuzzleToken({required this.label});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    decoration: BoxDecoration(
      gradient: AppTheme.accentButtonGradient,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}

class _PositionPuzzle extends StatelessWidget {
  final PuzzleLevel level;

  const _PositionPuzzle({required this.level});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameViewModel>();
    final norm = game.positionNorm;
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxX = (constraints.maxWidth - 52).clamp(
                0.0,
                double.infinity,
              );
              final maxY = (constraints.maxHeight - 52).clamp(
                0.0,
                double.infinity,
              );
              final targetNormX =
                  (level.positionTarget?['x'] as num?)?.toDouble() ?? 0;
              final targetNormY =
                  (level.positionTarget?['y'] as num?)?.toDouble() ?? 0;
              return GestureDetector(
                key: const Key('position_area'),
                onPanUpdate: (details) {
                  final box = context.findRenderObject()! as RenderBox;
                  final position = box.globalToLocal(details.globalPosition);
                  if (maxX <= 0 || maxY <= 0) return;
                  game.setPositionNorm(
                    (position.dx.clamp(0, maxX) / maxX).toDouble(),
                    (position.dy.clamp(0, maxY) / maxY).toDouble(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: (targetNormX * maxX).clamp(0.0, maxX).toDouble(),
                        top: (targetNormY * maxY).clamp(0.0, maxY).toDouble(),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.secondaryColor.withValues(
                                alpha: .3,
                              ),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 12,
                        top: 12,
                        child: Icon(Icons.ads_click, color: Colors.white38),
                      ),
                      Positioned(
                        left: ((norm['x'] ?? 0) * maxX).toDouble(),
                        top: ((norm['y'] ?? 0) * maxY).toDouble(),
                        child: const Icon(
                          Icons.star_rounded,
                          size: 48,
                          color: AppTheme.warningColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            key: const Key('submit_position'),
            onPressed: game.submitPosition,
            child: Text(AppLocalizations.of(context).translate('submit')),
          ),
        ),
      ],
    );
  }
}

class _MultiStepPuzzle extends StatelessWidget {
  final PuzzleLevel level;

  const _MultiStepPuzzle({required this.level});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameViewModel>();
    final language = context.watch<UserProgressViewModel>().languageCode;
    final total = (level.extraData?['totalSteps'] as num?)?.toInt() ?? 3;
    final stepText = level.getStepText(language, game.multiStepCurrent);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${game.multiStepCurrent} / $total',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (stepText != null) ...[
          const SizedBox(height: 10),
          Text(
            stepText,
            key: const Key('multi_step_text'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
        const SizedBox(height: 18),
        LinearProgressIndicator(value: game.multiStepCurrent / total),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          key: const Key('multi_step_action'),
          onPressed: game.advanceMultiStep,
          icon: const Icon(Icons.touch_app_rounded),
          label: Text(
            game.multiStepCurrent == total
                ? AppLocalizations.of(context).translate('submit')
                : AppLocalizations.of(context).translate('continue_label'),
          ),
        ),
      ],
    );
  }
}

class _TextAnswerPuzzle extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const _TextAnswerPuzzle({required this.onSubmit});

  @override
  State<_TextAnswerPuzzle> createState() => _TextAnswerPuzzleState();
}

class _TextAnswerPuzzleState extends State<_TextAnswerPuzzle> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(
        key: const Key('text_answer'),
        controller: _controller,
        textInputAction: TextInputAction.done,
        onSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate('your_answer'),
          border: const OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 14),
      ElevatedButton(
        onPressed: () => widget.onSubmit(_controller.text),
        child: Text(AppLocalizations.of(context).translate('submit')),
      ),
    ],
  );
}

class _MemoryPuzzle extends StatefulWidget {
  final PuzzleLevel level;

  const _MemoryPuzzle({required this.level});

  @override
  State<_MemoryPuzzle> createState() => _MemoryPuzzleState();
}

class _MemoryPuzzleState extends State<_MemoryPuzzle> {
  Timer? _timer;
  bool _showSequence = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showSequence = false);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameViewModel>();
    final text = AppLocalizations.of(context);
    final sequence = widget.level.targetSequence ?? const <int>[];
    final maxValue = sequence.fold<int>(
      0,
      (maximum, value) => math.max(maximum, value),
    );
    final count = math.max(
      (widget.level.extraData?['itemsCount'] as num?)?.toInt() ?? 0,
      math.max(maxValue + 1, 4),
    );
    return Column(
      children: [
        Text(
          _showSequence
              ? text.translate('memorize')
              : text.translate('repeat_sequence'),
        ),
        const SizedBox(height: 14),
        if (_showSequence)
          Expanded(
            child: Center(
              child: Text(
                sequence.map((value) => value + 1).join('   •   '),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.warningColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        else
          Expanded(
            child: _SequenceGrid(
              count: count,
              sequence: game.tapSequence,
              onTap: game.addTapIndex,
              onReset: game.resetTaps,
            ),
          ),
      ],
    );
  }
}

class _WrongAnswerBanner extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _WrongAnswerBanner({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 14),
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: AppTheme.accentColor.withValues(alpha: .15),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppTheme.accentColor.withValues(alpha: .5)),
    ),
    child: Row(
      children: [
        const Icon(Icons.info_outline, color: AppTheme.accentColor),
        const SizedBox(width: 10),
        Expanded(child: Text(message)),
        TextButton(
          onPressed: onRetry,
          child: Text(AppLocalizations.of(context).translate('try_again')),
        ),
      ],
    ),
  );
}

class _CompletionPanel extends StatelessWidget {
  final PuzzleLevel level;

  const _CompletionPanel({required this.level});

  @override
  Widget build(BuildContext context) {
    final game = context.read<GameViewModel>();
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    final nextId = level.id + 1;
    return Stack(
      children: [
        const Positioned.fill(child: IgnorePointer(child: ConfettiBurst())),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events_rounded,
                  size: 92,
                  color: AppTheme.warningColor,
                ),
                const SizedBox(height: 12),
                Text(
                  text.translate('level_cleared'),
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  '★' * game.calculateStars(),
                  style: const TextStyle(
                    color: AppTheme.warningColor,
                    fontSize: 34,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  '${text.translate('explanation')}\n${level.getExplanation(progress.languageCode)}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  key: const Key('next_level_button'),
                  onPressed: nextId <= AppConstants.totalLevels
                      ? () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (_) => GameScreen(levelId: nextId),
                          ),
                        )
                      : () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text(
                    text.translate(
                      nextId <= AppConstants.totalLevels
                          ? 'next_level'
                          : 'levels',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: game.retryLevel,
                  child: Text(text.translate('replay')),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    MaterialLocalizations.of(context).backButtonTooltip,
                  ),
                ),
                if (game.hintsRevealedCount == 0)
                  Text(
                    '+${level.rewardCoins} ${text.translate('coins')}',
                    style: const TextStyle(color: AppTheme.successColor),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
