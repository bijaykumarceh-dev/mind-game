import 'package:flutter/material.dart';
import '../services/ad_service.dart';
import 'user_progress_viewmodel.dart';

class ShopViewModel extends ChangeNotifier {
  final UserProgressViewModel userProgressVM;
  final AdService adService;

  ShopViewModel({
    required this.userProgressVM,
    required this.adService,
  });

  bool buyHintsWithCoins() {
    if (userProgressVM.spendCoins(50)) {
      userProgressVM.addHints(3);
      return true;
    }
    return false;
  }

  void watchAdForCoins() {
    adService.showRewardedAd(
      onRewarded: (reward) {
        userProgressVM.addCoins(30);
      },
      onAdClosedOrFailed: () {},
    );
  }

  void watchAdForHints() {
    adService.showRewardedAd(
      onRewarded: (reward) {
        userProgressVM.addHints(2);
      },
      onAdClosedOrFailed: () {},
    );
  }
}
