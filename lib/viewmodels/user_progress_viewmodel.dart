import 'package:flutter/material.dart';

import '../models/user_progress.dart';
import '../services/audio_service.dart';
import '../services/persistence_service.dart';

class UserProgressViewModel extends ChangeNotifier {
  final PersistenceService _persistence;
  final AudioService _audio;

  late UserProgress _progress;
  late String _languageCode;
  late bool _soundEnabled;
  late double _textScale;

  UserProgressViewModel(this._persistence, this._audio) {
    _progress = _persistence.loadProgress();
    _languageCode = _persistence.loadLanguage();
    _soundEnabled = _persistence.loadSoundEnabled();
    _textScale = _persistence.loadTextScale();
    _audio.isEnabled = _soundEnabled;
  }

  UserProgress get progress => _progress;
  String get languageCode => _languageCode;
  bool get soundEnabled => _soundEnabled;
  double get textScale => _textScale;

  int get coins => _progress.coins;
  int get hintsInventory => _progress.hintsInventory;
  int get unlockedLevelMax => _progress.unlockedLevelMax;
  bool get isAdsRemoved => _progress.isAdsRemoved;
  int get totalAnswers => _progress.totalAnswers;
  int get wrongAnswers => _progress.wrongAnswers;
  int get noHintClears => _progress.noHintClears;
  int get totalStars => _progress.totalStars;
  List<int> get claimedDays => _progress.claimedDays;

  void setLanguage(String code) {
    if (_languageCode == code) return;
    _languageCode = code;
    _persistence.saveLanguage(code);
    notifyListeners();
  }

  void toggleSound() {
    _soundEnabled = !_soundEnabled;
    _audio.isEnabled = _soundEnabled;
    _persistence.saveSoundEnabled(_soundEnabled);
    notifyListeners();
  }

  void setTextScale(double scale) {
    final normalized = scale.clamp(0.8, 1.4);
    if ((normalized - _textScale).abs() < 0.001) return;
    _textScale = normalized;
    _persistence.saveTextScale(normalized);
    notifyListeners();
  }

  bool isLevelUnlocked(int levelId) => _progress.isLevelUnlocked(levelId);

  bool isLevelCompleted(int levelId) => _progress.isLevelCompleted(levelId);

  int getStars(int levelId) => _progress.getStars(levelId);

  void addCoins(int amount) {
    _progress.coins += amount;
    _persistence.saveProgress(_progress);
    _audio.playCoinReward();
    notifyListeners();
  }

  bool spendCoins(int amount) {
    if (_progress.coins >= amount) {
      _progress.coins -= amount;
      _persistence.saveProgress(_progress);
      notifyListeners();
      return true;
    }
    return false;
  }

  void addHints(int count) {
    _progress.hintsInventory += count;
    _persistence.saveProgress(_progress);
    notifyListeners();
  }

  bool consumeHint() {
    if (_progress.hintsInventory > 0) {
      _progress.hintsInventory--;
      _persistence.saveProgress(_progress);
      _audio.playHint();
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Records a submitted answer so the statistics screen can report real
  /// accuracy instead of a made-up number.
  void recordAnswer({required bool isCorrect}) {
    _progress.totalAnswers++;
    if (!isCorrect) _progress.wrongAnswers++;
    _persistence.saveProgress(_progress);
    notifyListeners();
  }

  /// Single reward grant upon level completion
  bool completeLevel(int levelId, int rewardCoins, int stars) {
    if (levelId < 1 || levelId > AppLimits.maxLevel || rewardCoins < 0) {
      return false;
    }
    bool isFirstTime = !_progress.isLevelCompleted(levelId);

    if (isFirstTime) {
      _progress.completedLevelIds.add(levelId);
      _progress.coins += rewardCoins;
      if (_progress.unlockedLevelMax < levelId + 1 &&
          levelId < AppLimits.maxLevel) {
        _progress.unlockedLevelMax = levelId + 1;
      }
      if (stars >= 3) _progress.noHintClears++;
    }

    int currentStars = _progress.getStars(levelId);
    final normalizedStars = stars.clamp(0, 3);
    if (normalizedStars > currentStars) {
      _progress.levelStars[levelId] = normalizedStars;
    }

    _persistence.saveProgress(_progress);
    _audio.playVictory();
    notifyListeners();
    return isFirstTime;
  }

  void playWrongAnswer() => _audio.playWrong();

  /// Replaces all progress with imported data; returns false when the pasted
  /// payload is not a valid export and leaves the save untouched.
  bool importProgress(String raw) {
    final parsed = UserProgress.tryParse(raw.trim());
    if (parsed == null) return false;
    _progress = parsed;
    _persistence.saveProgress(_progress);
    notifyListeners();
    return true;
  }

  String exportProgress() => _progress.encode();

  void applyVerifiedRemoveAdsPurchase() {
    _progress.isAdsRemoved = true;
    _persistence.saveProgress(_progress);
    notifyListeners();
  }
}

/// Hard limits shared with the bundled level repository.
class AppLimits {
  static const int maxLevel = 100;
}
