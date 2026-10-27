import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../core/constants/app_constants.dart';

class AdService {
  bool _isInitialized = false;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  int _completedLevelsSinceAd = 0;
  final Completer<void> _initialization = Completer<void>();

  bool get isInitialized => _isInitialized;

  /// Completes once the initialization attempt has finished, successfully or
  /// not. Widgets that need ads can await this instead of racing startup.
  Future<void> get ready => _initialization.future;

  Future<void> initialize() async {
    if (kIsWeb) {
      if (!_initialization.isCompleted) _initialization.complete();
      return;
    }
    try {
      await MobileAds.instance.initialize();
      _isInitialized = true;
      _loadInterstitialAd();
      _loadRewardedAd();
    } catch (e) {
      debugPrint('AdMob initialization exception: $e');
    } finally {
      if (!_initialization.isCompleted) _initialization.complete();
    }
  }

  void _loadInterstitialAd() {
    if (!_isInitialized) return;

    InterstitialAd.load(
      adUnitId: AppConstants.androidInterstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  _interstitialAd = null;
                  _loadInterstitialAd();
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                  _interstitialAd = null;
                  _loadInterstitialAd();
                },
              );
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
          _interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialIfReady() {
    _completedLevelsSinceAd++;
    if (_completedLevelsSinceAd >= AppConstants.interstitialFrequency) {
      if (_interstitialAd != null) {
        _interstitialAd!.show();
        _completedLevelsSinceAd = 0;
      }
    }
  }

  void _loadRewardedAd() {
    if (!_isInitialized) return;

    RewardedAd.load(
      adUnitId: AppConstants.androidRewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('RewardedAd failed to load: $error');
          _rewardedAd = null;
        },
      ),
    );
  }

  void showRewardedAd({
    required Function(RewardItem reward) onRewarded,
    required VoidCallback onAdClosedOrFailed,
  }) {
    if (_rewardedAd != null) {
      bool rewardEarned = false;
      bool terminalCallbackCalled = false;
      void reportUnavailableOnce() {
        if (terminalCallbackCalled || rewardEarned) return;
        terminalCallbackCalled = true;
        onAdClosedOrFailed();
      }

      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _rewardedAd = null;
          _loadRewardedAd();
          reportUnavailableOnce();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _rewardedAd = null;
          _loadRewardedAd();
          reportUnavailableOnce();
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          if (rewardEarned) return;
          rewardEarned = true;
          onRewarded(reward);
        },
      );
    } else {
      onAdClosedOrFailed();
      _loadRewardedAd();
    }
  }

  BannerAd createBannerAd(VoidCallback onLoaded) {
    return BannerAd(
      adUnitId: AppConstants.androidBannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => onLoaded(),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('BannerAd failed to load: $error');
        },
      ),
    );
  }
}
