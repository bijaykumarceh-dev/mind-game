import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_constants.dart';
import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../repositories/level_repository.dart';
import '../services/ad_service.dart';
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
    final challenge = DailyChallengeViewModel(
      userProgressVM: progress,
      levelRepository: repository,
    );
    final level = repository.getLevelById(challenge.todaysLevelId);
    final text = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('daily_challenge'))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.today_rounded,
                  size: 76, color: AppTheme.secondaryColor),
              const SizedBox(height: 20),
              Text(text.translate('puzzle_of_day'),
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 14),
              Text(
                progress.languageCode == 'hi'
                    ? level.getQuestion('hi')
                    : level.getQuestion('en'),
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
                child: Text(text.translate(
                    challenge.canClaimToday ? 'claim_reward' : 'claimed')),
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
    final stars = progress.progress.levelStars.values.fold<int>(
      0,
      (sum, count) => sum + count,
    );
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
            value: '$stars / ${AppConstants.totalLevels * 3}',
          ),
          _StatCard(
            icon: Icons.track_changes_rounded,
            label: text.translate('accuracy'),
            value: solved == 0 ? '—' : '${(solved * 100 / AppConstants.totalLevels).round()}%',
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
        ],
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
    final shop = ShopViewModel(
      userProgressVM: progress,
      adService: context.read<AdService>(),
    );
    return Scaffold(
      appBar: AppBar(title: Text(text.translate('shop'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: AppTheme.warningColor),
              title: Text(text.translate('buy_hints')),
              subtitle: Text('${text.translate('coins')}: ${progress.coins}'),
              onTap: () {
                final purchased = shop.buyHintsWithCoins();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(purchased
                        ? '+3 ${text.translate('hints')}'
                        : 'Not enough ${text.translate('coins').toLowerCase()}'),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.ondemand_video_rounded),
              title: Text(text.translate('watch_ad_coins')),
              subtitle: Text(text.translate('ad_unavailable')),
              enabled: false,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.block_rounded),
              title: Text(text.translate(
                  progress.isAdsRemoved ? 'ads_removed' : 'remove_ads')),
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
            'How to play',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Read each puzzle carefully and use the interaction shown on screen. '
            'Hints cost one hint from your inventory. Completing a level for '
            'the first time earns its coin reward and unlocks the next level. '
            'Previously completed levels can be replayed without earning the '
            'completion reward again.',
          ),
          const SizedBox(height: 24),
          Text(
            text.translate('privacy_policy'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(text.translate('privacy_text')),
          const SizedBox(height: 14),
          const Text(
            'This build uses Google Mobile Ads test unit IDs. Ads are optional '
            'and failing to load does not block puzzle gameplay.',
          ),
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
