import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_constants.dart';
import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../models/achievement.dart';
import '../repositories/level_repository.dart';
import '../viewmodels/daily_challenge_viewmodel.dart';
import '../viewmodels/shop_viewmodel.dart';
import '../viewmodels/user_progress_viewmodel.dart';
import 'game_screen.dart';

class DailyChallengeScreen extends StatelessWidget {
  const DailyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<UserProgressViewModel>();
    final repository = context.read<LevelRepository>();
    final challenge = context.read<DailyChallengeViewModel>();
    final level = repository.getLevelById(challenge.todaysLevelId);
    final text = AppLocalizations.of(context);
    final history = challenge.recentClaimHistory();
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('daily_challenge'))),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.today_rounded,
                size: 76,
                color: AppTheme.secondaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                text.translate('puzzle_of_day'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 14),
              Text(
                level.getQuestion(progress.languageCode),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text('${text.translate('streak')}: ${challenge.dailyStreak}'),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => GameScreen(levelId: level.id),
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label: Text(text.translate('play')),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: challenge.canClaimToday
                    ? () {
                        challenge.claimDailyReward();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '+${AppConstants.dailyBonusCoins} ${text.translate('coins')} · +1 ${text.translate('hint')}',
                            ),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  text.translate(
                    challenge.canClaimToday ? 'claim_reward' : 'claimed',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text.translate('last_30_days'),
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 1.35,
                children: [
                  for (final entry in history)
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: entry.claimed
                            ? AppTheme.successColor.withValues(alpha: .35)
                            : AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: entry.claimed
                              ? AppTheme.successColor
                              : Colors.white12,
                        ),
                      ),
                      child: Text(
                        '${DateTime.fromMillisecondsSinceEpoch(entry.day * 86400000).day}',
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    final solved = progress.progress.completedLevelIds.length;
    final accuracy = progress.progress.answerAccuracy;
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('stats'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _StatCard(
            icon: Icons.check_circle_outline,
            label: text.translate('total_solved'),
            value: '$solved / ${AppConstants.totalLevels}',
          ),
          _StatCard(
            icon: Icons.star_rounded,
            label: text.translate('stars_earned'),
            value: '${progress.totalStars} / ${AppConstants.totalLevels * 3}',
          ),
          _StatCard(
            icon: Icons.track_changes_rounded,
            label: text.translate('accuracy'),
            value: accuracy == null ? '—' : '${accuracy.round()}%',
          ),
          _StatCard(
            icon: Icons.quiz_outlined,
            label: text.translate('total_answers'),
            value: '${progress.totalAnswers}',
          ),
          _StatCard(
            icon: Icons.workspace_premium_rounded,
            label: text.translate('no_hint_clears'),
            value: '${progress.noHintClears}',
          ),
          _StatCard(
            icon: Icons.monetization_on,
            label: text.translate('coins'),
            value: '${progress.coins}',
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('settings'))),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: Text(text.translate('language')),
            trailing: DropdownButton<String>(
              value: progress.languageCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('हिन्दी')),
              ],
              onChanged: (value) {
                if (value != null) progress.setLanguage(value);
              },
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.volume_up_rounded),
            title: Text(text.translate('sound_sfx')),
            value: progress.soundEnabled,
            onChanged: (_) => progress.toggleSound(),
          ),
          ListTile(
            leading: const Icon(Icons.format_size_rounded),
            title: Text(text.translate('text_size')),
            subtitle: Slider(
              value: progress.textScale,
              min: 0.8,
              max: 1.4,
              divisions: 6,
              label: progress.textScale.toStringAsFixed(2),
              onChanged: progress.setTextScale,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.upload_rounded),
            title: Text(text.translate('export_progress')),
            subtitle: Text(text.translate('progress_copied')),
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: progress.exportProgress()),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(text.translate('progress_copied'))),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.download_rounded),
            title: Text(text.translate('import_progress')),
            subtitle: Text(text.translate('paste_progress_hint')),
            onTap: () => _importProgress(context, progress, text),
          ),
        ],
      ),
    );
  }

  Future<void> _importProgress(
    BuildContext context,
    UserProgressViewModel progress,
    AppLocalizations text,
  ) async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(text.translate('import_progress')),
        content: TextField(
          controller: controller,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: text.translate('paste_progress_hint'),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              MaterialLocalizations.of(dialogContext).cancelButtonLabel,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(text.translate('import_progress')),
          ),
        ],
      ),
    );
    final raw = controller.text;
    controller.dispose();

    if (confirmed != true || !context.mounted) return;
    final imported = progress.importProgress(raw);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text.translate(imported ? 'progress_imported' : 'invalid_progress'),
        ),
      ),
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    final shop = context.read<ShopViewModel>();

    void snack(String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      appBar: AppBar(title: Text(text.translate('shop'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.lightbulb,
                color: AppTheme.warningColor,
              ),
              title: Text(text.translate('buy_hints')),
              subtitle: Text('${text.translate('coins')}: ${progress.coins}'),
              onTap: () {
                final purchased = shop.buyHintsWithCoins();
                snack(
                  purchased
                      ? '+3 ${text.translate('hints')}'
                      : text.translate('not_enough_coins'),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.ondemand_video_rounded),
              title: Text(text.translate('watch_ad_coins')),
              subtitle: Text(text.translate('free')),
              onTap: () => shop.watchAdForCoins(
                onReward: () => snack(
                  '+${AppConstants.adRewardCoins} ${text.translate('coins')}',
                ),
                onUnavailable: () => snack(text.translate('ad_unavailable')),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.ondemand_video_rounded),
              title: Text(text.translate('watch_ad_for_hints')),
              subtitle: Text(text.translate('free')),
              onTap: () => shop.watchAdForHints(
                onReward: () => snack(
                  '+${AppConstants.adRewardHints} ${text.translate('hints')}',
                ),
                onUnavailable: () => snack(text.translate('ad_unavailable')),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.block_rounded),
              title: Text(
                text.translate(
                  progress.isAdsRemoved ? 'ads_removed' : 'remove_ads',
                ),
              ),
              subtitle: Text(text.translate('purchase_note')),
              enabled: false,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restore_rounded),
            title: Text(text.translate('restore_purchases')),
            subtitle: Text(text.translate('purchase_note')),
            enabled: false,
          ),
        ],
      ),
    );
  }
}

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<UserProgressViewModel>();
    final text = AppLocalizations.of(context);
    final achievements = evaluateAchievements(progress.progress);
    final unlockedCount = achievements.where((a) => a.unlocked).length;
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('achievements'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              '$unlockedCount / ${achievements.length}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          for (final achievement in achievements)
            Card(
              child: ListTile(
                leading: Icon(
                  achievement.icon,
                  color: achievement.unlocked
                      ? AppTheme.warningColor
                      : Colors.white38,
                ),
                title: Text(text.translate(achievement.titleKey)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text.translate(achievement.descriptionKey)),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: achievement.fraction,
                        minHeight: 6,
                        backgroundColor: AppTheme.surfaceColor,
                      ),
                    ),
                  ],
                ),
                trailing: achievement.unlocked
                    ? const Icon(
                        Icons.check_circle_rounded,
                        color: AppTheme.successColor,
                      )
                    : Text(
                        '${achievement.current}/${achievement.target}',
                        style: const TextStyle(color: Colors.white54),
                      ),
                isThreeLine: true,
              ),
            ),
        ],
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('help'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            text.translate('app_title'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(text.translate('sub_title')),
          const SizedBox(height: 20),
          Text(
            text.translate('how_to_play'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(text.translate('how_to_play_text')),
          const SizedBox(height: 24),
          Text(
            text.translate('privacy_policy'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(text.translate('privacy_text')),
          const SizedBox(height: 14),
          Text(text.translate('ads_note')),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon, color: AppTheme.secondaryColor),
      title: Text(label),
      trailing: Text(
        value,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    ),
  );
}
