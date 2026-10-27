import 'package:flutter/material.dart';

import 'user_progress.dart';

/// A badge computed live from the player's saved progress.
class Achievement {
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
  final int current;
  final int target;

  const Achievement({
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    required this.current,
    required this.target,
  });

  bool get unlocked => current >= target;

  double get fraction {
    if (target <= 0) return 1;
    return (current / target).clamp(0.0, 1.0);
  }
}

/// All badges offered by the game, derived from [progress] so they unlock
/// automatically as the player plays.
List<Achievement> evaluateAchievements(UserProgress progress) {
  final solved = progress.completedLevelIds.length;
  final coinHigh = progress.coins;

  return <Achievement>[
    Achievement(
      titleKey: 'ach_first_title',
      descriptionKey: 'ach_first_desc',
      icon: Icons.flag_rounded,
      current: solved >= 1 ? 1 : 0,
      target: 1,
    ),
    Achievement(
      titleKey: 'ach_10_title',
      descriptionKey: 'ach_10_desc',
      icon: Icons.local_fire_department_rounded,
      current: solved.clamp(0, 10),
      target: 10,
    ),
    Achievement(
      titleKey: 'ach_25_title',
      descriptionKey: 'ach_25_desc',
      icon: Icons.military_tech_rounded,
      current: solved.clamp(0, 25),
      target: 25,
    ),
    Achievement(
      titleKey: 'ach_50_title',
      descriptionKey: 'ach_50_desc',
      icon: Icons.psychology_alt_rounded,
      current: solved.clamp(0, 50),
      target: 50,
    ),
    Achievement(
      titleKey: 'ach_100_title',
      descriptionKey: 'ach_100_desc',
      icon: Icons.emoji_events_rounded,
      current: solved.clamp(0, 100),
      target: 100,
    ),
    Achievement(
      titleKey: 'ach_stars_title',
      descriptionKey: 'ach_stars_desc',
      icon: Icons.star_rounded,
      current: progress.totalStars.clamp(0, 150),
      target: 150,
    ),
    Achievement(
      titleKey: 'ach_nohint_title',
      descriptionKey: 'ach_nohint_desc',
      icon: Icons.workspace_premium_rounded,
      current: progress.noHintClears.clamp(0, 10),
      target: 10,
    ),
    Achievement(
      titleKey: 'ach_streak_title',
      descriptionKey: 'ach_streak_desc',
      icon: Icons.calendar_month_rounded,
      current: progress.dailyStreak.clamp(0, 7),
      target: 7,
    ),
    Achievement(
      titleKey: 'ach_coins_title',
      descriptionKey: 'ach_coins_desc',
      icon: Icons.monetization_on_rounded,
      current: coinHigh.clamp(0, 500),
      target: 500,
    ),
  ];
}
