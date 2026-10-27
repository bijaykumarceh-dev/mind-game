import 'package:flutter/services.dart';

class AudioService {
  bool isEnabled = true;

  void playTap() {
    if (!isEnabled) return;
    HapticFeedback.lightImpact();
  }

  void playCorrect() {
    if (!isEnabled) return;
    HapticFeedback.mediumImpact();
  }

  void playWrong() {
    if (!isEnabled) return;
    HapticFeedback.heavyImpact();
  }

  void playHint() {
    if (!isEnabled) return;
    HapticFeedback.selectionClick();
  }

  void playCoinReward() {
    if (!isEnabled) return;
    HapticFeedback.mediumImpact();
  }
}
