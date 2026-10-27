import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Plays the bundled WAV sound effects and drives haptic feedback.
///
/// Sound playback is skipped automatically in widget/unit tests and on the
/// web, where the audio plugin is unavailable, so gameplay logic never
/// depends on a sound actually playing.
class AudioService {
  bool isEnabled = true;

  static final bool _canPlaySounds =
      !kIsWeb && !Platform.environment.containsKey('FLUTTER_TEST');

  static const Map<String, String> _sounds = {
    'tap': 'click.wav',
    'correct': 'correct.wav',
    'victory': 'victory.wav',
    'wrong': 'wrong.wav',
    'hint': 'hint.wav',
    'coin': 'coin.wav',
    'tick': 'tick.wav',
  };

  List<AudioPlayer>? _pool;
  int _nextPlayer = 0;

  List<AudioPlayer> _players() =>
      _pool ??= List<AudioPlayer>.generate(3, (_) => AudioPlayer());

  void _play(String name) {
    if (!isEnabled || !_canPlaySounds) return;
    final file = _sounds[name];
    if (file == null) return;
    final players = _players();
    final player = players[_nextPlayer = (_nextPlayer + 1) % players.length];
    unawaited(player.stop());
    unawaited(
      player.play(AssetSource('sounds/$file')).catchError((Object error) {
        debugPrint('Sound playback failed ($file): $error');
      }),
    );
  }

  void _haptic(HapticFeedbackType type) {
    if (!isEnabled) return;
    switch (type) {
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
    }
  }

  void playTap() {
    _play('tap');
    _haptic(HapticFeedbackType.light);
  }

  void playWrong() {
    _play('wrong');
    _haptic(HapticFeedbackType.heavy);
  }

  void playVictory() {
    _play('victory');
    _haptic(HapticFeedbackType.medium);
  }

  void playHint() {
    _play('hint');
    _haptic(HapticFeedbackType.selection);
  }

  void playCoinReward() {
    _play('coin');
    _haptic(HapticFeedbackType.medium);
  }

  void playTick() {
    _play('tick');
    _haptic(HapticFeedbackType.selection);
  }

  Future<void> dispose() async {
    final players = _pool;
    if (players == null) return;
    for (final player in players) {
      await player.dispose();
    }
    _pool = null;
  }
}

enum HapticFeedbackType { light, medium, heavy, selection }
