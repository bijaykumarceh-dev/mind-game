import 'dart:async';

import 'package:flutter/material.dart';

import '../models/interaction_type.dart';
import '../models/puzzle_level.dart';
import '../puzzle_engine/validators/validators.dart';
import '../services/ad_service.dart';
import '../services/audio_service.dart';
import 'user_progress_viewmodel.dart';

enum GameState { playing, wrongAnswer, completed }

class GameViewModel extends ChangeNotifier {
  final PuzzleLevel level;
  final UserProgressViewModel userProgressVM;
  final AdService adService;
  final AudioService audio;

  GameState _state = GameState.playing;
  int _hintsRevealedCount = 0;

  // Interaction inputs
  dynamic _currentInteractionInput;
  final List<int> _tapSequence = [];
  int _multiStepCurrent = 1;
  Map<String, double> _positionNorm = {'x': 0.0, 'y': 0.0};
  String? _draggedSourceId;
  String? _droppedTargetId;

  // Countdown for timed levels
  Timer? _timer;
  int _secondsLeft = 0;

  GameViewModel({
    required this.level,
    required this.userProgressVM,
    required this.adService,
    required this.audio,
  }) {
    _startTimer();
  }

  GameState get state => _state;
  int get hintsRevealedCount => _hintsRevealedCount;
  List<int> get tapSequence => List.unmodifiable(_tapSequence);
  int get multiStepCurrent => _multiStepCurrent;

  /// Star position normalized to the play area (0..1), so the same target
  /// works on every screen size.
  Map<String, double> get positionNorm => _positionNorm;
  String? get draggedSourceId => _draggedSourceId;
  String? get droppedTargetId => _droppedTargetId;
  bool get hasTimer => level.interactionType == InteractionType.timedMemory;
  int get secondsLeft => _secondsLeft;

  int get maxHints => level.getHints(userProgressVM.languageCode).length;

  int get _timeLimitSeconds =>
      (level.extraData?['timeLimitSeconds'] as num?)?.toInt() ?? 15;

  void _startTimer() {
    _timer?.cancel();
    if (!hasTimer) return;
    _secondsLeft = _timeLimitSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_state != GameState.playing) {
        timer.cancel();
        return;
      }
      _secondsLeft--;
      if (_secondsLeft <= 3 && _secondsLeft > 0) audio.playTick();
      if (_secondsLeft <= 0) {
        timer.cancel();
        _onTimeUp();
      }
      notifyListeners();
    });
  }

  void _onTimeUp() {
    if (_state != GameState.playing) return;
    _currentInteractionInput = null;
    submitAnswer();
  }

  int calculateStars() {
    if (_hintsRevealedCount == 0) return 3;
    if (_hintsRevealedCount == 1) return 2;
    return 1;
  }

  void revealNextHint() {
    if (_hintsRevealedCount < maxHints) {
      if (userProgressVM.consumeHint()) {
        _hintsRevealedCount++;
        notifyListeners();
      }
    }
  }

  void selectMultipleChoice(int index) {
    _currentInteractionInput = index;
    submitAnswer();
  }

  void addTapIndex(int index) {
    audio.playTap();
    _tapSequence.add(index);
    _currentInteractionInput = _tapSequence;
    notifyListeners();

    if (level.targetSequence != null &&
        _tapSequence.length >= level.targetSequence!.length) {
      submitAnswer();
    } else if (level.solutionIndex != null) {
      _currentInteractionInput = index;
      submitAnswer();
    }
  }

  void resetTaps() {
    _tapSequence.clear();
    _currentInteractionInput = null;
    notifyListeners();
  }

  void setDragDrop(String source, String target) {
    _draggedSourceId = source;
    _droppedTargetId = target;
    _currentInteractionInput = {'source': source, 'target': target};
    submitAnswer();
  }

  void setPositionNorm(double normalizedX, double normalizedY) {
    _positionNorm = {
      'x': normalizedX.clamp(0.0, 1.0),
      'y': normalizedY.clamp(0.0, 1.0),
    };
    notifyListeners();
  }

  void submitPosition() {
    _currentInteractionInput = {
      'x': _positionNorm['x']!,
      'y': _positionNorm['y']!,
    };
    submitAnswer();
  }

  void advanceMultiStep() {
    audio.playTap();
    final totalSteps = (level.extraData?['totalSteps'] as num?)?.toInt() ?? 3;
    if (_multiStepCurrent < totalSteps) {
      _multiStepCurrent++;
      _currentInteractionInput = {
        'step': _multiStepCurrent,
        'isFinal': _multiStepCurrent == totalSteps,
      };
      notifyListeners();
      if (_multiStepCurrent == totalSteps) {
        submitAnswer();
      }
    }
  }

  void submitTextAnswer(String text) {
    _currentInteractionInput = text;
    submitAnswer();
  }

  void submitAnswer() {
    if (_state == GameState.completed) return;
    final result = PuzzleEngine.validate(
      level: level,
      userInteraction: _currentInteractionInput,
    );

    userProgressVM.recordAnswer(isCorrect: result.isCorrect);

    if (result.isCorrect) {
      _state = GameState.completed;
      _timer?.cancel();
      final stars = calculateStars();
      final firstCompletion = userProgressVM.completeLevel(
        level.id,
        level.rewardCoins,
        stars,
      );
      if (firstCompletion) adService.showInterstitialIfReady();
    } else {
      _state = GameState.wrongAnswer;
      userProgressVM.playWrongAnswer();
    }
    notifyListeners();
  }

  void retryLevel() {
    _state = GameState.playing;
    _tapSequence.clear();
    _currentInteractionInput = null;
    _multiStepCurrent = 1;
    _positionNorm = {'x': 0.0, 'y': 0.0};
    _draggedSourceId = null;
    _droppedTargetId = null;
    _startTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
