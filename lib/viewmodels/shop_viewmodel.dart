import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../services/ad_service.dart';
import 'user_progress_viewmodel.dart';

class ShopViewModel extends ChangeNotifier {
  final UserProgressViewModel userProgressVM;
  final AdService adService;

  ShopViewModel({required this.userProgressVM, required this.adService});

  bool buyHintsWithCoins() {
    if (userProgressVM.spendCoins(50)) {
      userProgressVM.addHints(3);
      return true;
    }
    return false;
  }

  /// Rewarded-ad coin grant. The reward only fires from Google's verified
  /// callback; a missing, dismissed, or failed ad reports [onUnavailable].
  void watchAdForCoins({VoidCallback? onReward, VoidCallback? onUnavailable}) {
    adService.showRewardedAd(
      onRewarded: (_) {
        userProgressVM.addCoins(AppConstants.adRewardCoins);
        onReward?.call();
      },
      onAdClosedOrFailed: () => onUnavailable?.call(),
    );
  }

  void watchAdForHints({VoidCallback? onReward, VoidCallback? onUnavailable}) {
    adService.showRewardedAd(
      onRewarded: (_) {
        userProgressVM.addHints(AppConstants.adRewardHints);
        onReward?.call();
      },
      onAdClosedOrFailed: () => onUnavailable?.call(),
    );
  }
}
