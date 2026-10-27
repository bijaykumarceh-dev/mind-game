import 'package:flutter/material.dart';
import '../models/puzzle_level.dart';
import '../puzzle_engine/validators/validators.dart';
import '../services/ad_service.dart';
import 'user_progress_viewmodel.dart';

enum GameState {
  playing,
  wrongAnswer,
  completed,
}

class GameViewModel extends ChangeNotifier {
  final PuzzleLevel level;
  final UserProgressViewModel userProgressVM;
  final AdService adService;

  GameState _state = GameState.playing;
  int _hintsRevealedCount = 0;

  // Interaction inputs
  dynamic _currentInteractionInput;
  final List<int> _tapSequence = [];
  int _multiStepCurrent = 1;
  Map<String, double> _positionCoord = {'x': 0.0, 'y': 0.0};
  String? _draggedSourceId;
  String? _droppedTargetId;

  GameViewModel({
    required this.level,
    required this.userProgressVM,
    required this.adService,
  });

  GameState get state => _state;
  int get hintsRevealedCount => _hintsRevealedCount;
  List<int> get tapSequence => List.unmodifiable(_tapSequence);
  int get multiStepCurrent => _multiStepCurrent;
  Map<String, double> get positionCoord => _positionCoord;
  String? get draggedSourceId => _draggedSourceId;
  String? get droppedTargetId => _droppedTargetId;

  int calculateStars() {
    if (_hintsRevealedCount == 0) return 3;
    if (_hintsRevealedCount == 1) return 2;
    return 1;
  }

  void revealNextHint() {
    if (_hintsRevealedCount < 3) {
      if (userProgressVM.consumeHint()) {
        _hintsRevealedCount++;
        notifyListeners();
      }
    }
  }

  void watchAdForHint() {
    adService.showRewardedAd(
      onRewarded: (reward) {
        userProgressVM.addHints(1);
        revealNextHint();
      },
      onAdClosedOrFailed: () {},
    );
  }

  void selectMultipleChoice(int index) {
    _currentInteractionInput = index;
    submitAnswer();
  }

  void addTapIndex(int index) {
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

  void setPosition(double x, double y) {
    _positionCoord = {'x': x, 'y': y};
    _currentInteractionInput = {'x': x, 'y': y};
    notifyListeners();
  }

  void submitPosition() {
    submitAnswer();
  }

  void advanceMultiStep() {
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

    if (result.isCorrect) {
      _state = GameState.completed;
      final stars = calculateStars();
      final firstCompletion =
          userProgressVM.completeLevel(level.id, level.rewardCoins, stars);
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
    _positionCoord = {'x': 0.0, 'y': 0.0};
    _draggedSourceId = null;
    _droppedTargetId = null;
    notifyListeners();
  }
}
