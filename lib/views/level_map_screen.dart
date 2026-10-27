import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../models/puzzle_category.dart';
import '../models/puzzle_level.dart';
import '../repositories/level_repository.dart';
import '../viewmodels/user_progress_viewmodel.dart';
import 'game_screen.dart';

class LevelMapScreen extends StatelessWidget {
  const LevelMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    final progress = context.watch<UserProgressViewModel>();
    final levels = context.read<LevelRepository>().allLevels;
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('levels'))),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: levels.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final PuzzleLevel level = levels[index];
          final unlocked = progress.isLevelUnlocked(level.id);
          final completed = progress.isLevelCompleted(level.id);
          return Material(
            color: AppTheme.cardBgColor,
            borderRadius: BorderRadius.circular(16),
            child: ListTile(
              key: Key('level_${level.id}'),
              leading: CircleAvatar(
                backgroundColor: completed
                    ? AppTheme.successColor
                    : unlocked
                    ? AppTheme.primaryColor
                    : AppTheme.surfaceColor,
                child: Icon(
                  completed
                      ? Icons.check_rounded
                      : unlocked
                      ? Icons.extension_rounded
                      : Icons.lock_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text('${text.translate('level')} ${level.id}'),
              subtitle: Row(
                children: [
                  Icon(level.category.icon, size: 14, color: Colors.white54),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      progress.languageCode == 'hi'
                          ? level.category.nameHi
                          : level.category.nameEn,
                    ),
                  ),
                ],
              ),
              trailing: completed
                  ? Text(
                      '★' * progress.getStars(level.id),
                      style: const TextStyle(color: AppTheme.warningColor),
                    )
                  : null,
              enabled: unlocked,
              onTap: unlocked
                  ? () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => GameScreen(levelId: level.id),
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
