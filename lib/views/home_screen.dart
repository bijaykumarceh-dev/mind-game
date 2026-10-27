import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/localization/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../repositories/level_repository.dart';
import '../viewmodels/user_progress_viewmodel.dart';
import 'game_screen.dart';
import 'level_map_screen.dart';
import 'secondary_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    final progress = context.watch<UserProgressViewModel>();
    final levels = context.read<LevelRepository>();
    final level = progress.unlockedLevelMax.clamp(1, levels.totalLevels);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 540),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 20),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 660),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.psychology_alt_rounded,
                                color: AppTheme.secondaryColor, size: 32),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                text.translate('app_title'),
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                            _CoinPill(coins: progress.coins),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Container(
                          width: 148,
                          height: 148,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.cardBgColor,
                            border: Border.all(
                                color: AppTheme.secondaryColor.withValues(alpha: .5),
                                width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryColor.withValues(alpha: .3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.lightbulb_rounded,
                              color: AppTheme.warningColor, size: 76),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          text.translate('app_title'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          text.translate('sub_title'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white70),
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton.icon(
                            key: const Key('play_button'),
                            icon: const Icon(Icons.play_arrow_rounded, size: 28),
                            label: Text('${text.translate('play')}  ·  $level'),
                            onPressed: () => _openLevel(context, level),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.map_outlined),
                            label: Text(text.translate('levels')),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => const LevelMapScreen(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.45,
                          children: [
                            _HomeTile(
                              icon: Icons.today_rounded,
                              label: text.translate('daily_challenge'),
                              onTap: () => _push(context, const DailyChallengeScreen()),
                            ),
                            _HomeTile(
                              icon: Icons.insights_rounded,
                              label: text.translate('stats'),
                              onTap: () => _push(context, const StatisticsScreen()),
                            ),
                            _HomeTile(
                              icon: Icons.settings_rounded,
                              label: text.translate('settings'),
                              onTap: () => _push(context, const SettingsScreen()),
                            ),
                            _HomeTile(
                              icon: Icons.storefront_rounded,
                              label: text.translate('shop'),
                              onTap: () => _push(context, const ShopScreen()),
                            ),
                            _HomeTile(
                              icon: Icons.help_outline_rounded,
                              label: text.translate('help'),
                              onTap: () => _push(context, const HelpScreen()),
                            ),
                            _HomeTile(
                              icon: Icons.replay_rounded,
                              label: text.translate('replay'),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const LevelMapScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openLevel(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => GameScreen(levelId: id)),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => screen));
  }
}

class _CoinPill extends StatelessWidget {
  final int coins;

  const _CoinPill({required this.coins});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.cardBgColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.monetization_on, color: AppTheme.warningColor, size: 18),
            const SizedBox(width: 5),
            Text('$coins', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
}

class _HomeTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HomeTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: AppTheme.cardBgColor.withValues(alpha: .85),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppTheme.secondaryColor, size: 22),
                const SizedBox(height: 5),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
}
