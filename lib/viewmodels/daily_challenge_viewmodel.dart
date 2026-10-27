import 'package:flutter/material.dart';
import '../repositories/level_repository.dart';

import 'user_progress_viewmodel.dart';

class DailyChallengeViewModel extends ChangeNotifier {
  final UserProgressViewModel userProgressVM;
  final LevelRepository levelRepository;

  DailyChallengeViewModel({
    required this.userProgressVM,
    required this.levelRepository,
  });

  bool get canClaimToday {
    final nowEpochDays = DateTime.now().millisecondsSinceEpoch ~/ (1000 * 60 * 60 * 24);
    final lastClaimDays = userProgressVM.progress.lastDailyClaimEpoch;
    return nowEpochDays > lastClaimDays;
  }

  int get dailyStreak => userProgressVM.progress.dailyStreak;

  int get todaysLevelId {
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return (dayOfYear % levelRepository.totalLevels) + 1;
  }

  bool claimDailyReward() {
    if (canClaimToday) {
      final nowEpochDays = DateTime.now().millisecondsSinceEpoch ~/ (1000 * 60 * 60 * 24);
      final lastClaimDays = userProgressVM.progress.lastDailyClaimEpoch;

      if (nowEpochDays == lastClaimDays + 1) {
        userProgressVM.progress.dailyStreak++;
      } else {
        userProgressVM.progress.dailyStreak = 1;
      }

      userProgressVM.progress.lastDailyClaimEpoch = nowEpochDays;
      userProgressVM.addCoins(50);
      userProgressVM.addHints(1);
      notifyListeners();
      return true;
    }
    return false;
  }
}
