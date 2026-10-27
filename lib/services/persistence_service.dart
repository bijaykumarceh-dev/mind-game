import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_progress.dart';

class PersistenceService {
  static const String _progressKey = 'user_progress';
  static const String _languageKey = 'app_language';
  static const String _soundKey = 'sound_enabled';
  static const String _textScaleKey = 'text_scale';

  final SharedPreferences _prefs;

  PersistenceService(this._prefs);

  static Future<PersistenceService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PersistenceService(prefs);
  }

  UserProgress loadProgress() {
    final raw = _prefs.getString(_progressKey);
    if (raw == null || raw.isEmpty) {
      return UserProgress();
    }
    return UserProgress.decode(raw);
  }

  Future<bool> saveProgress(UserProgress progress) async {
    return await _prefs.setString(_progressKey, progress.encode());
  }

  String loadLanguage() {
    return _prefs.getString(_languageKey) ?? 'en';
  }

  Future<bool> saveLanguage(String langCode) async {
    return await _prefs.setString(_languageKey, langCode);
  }

  bool loadSoundEnabled() {
    return _prefs.getBool(_soundKey) ?? true;
  }

  Future<bool> saveSoundEnabled(bool enabled) async {
    return await _prefs.setBool(_soundKey, enabled);
  }

  double loadTextScale() {
    final value = _prefs.getDouble(_textScaleKey);
    if (value == null || value < 0.8 || value > 1.4) return 1.0;
    return value;
  }

  Future<bool> saveTextScale(double scale) async {
    return await _prefs.setDouble(_textScaleKey, scale.clamp(0.8, 1.4));
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
