import 'dart:math';

import '../../models/interaction_type.dart';
import '../../models/puzzle_level.dart';

class ValidationResult {
  final bool isCorrect;
  final String? feedbackMessageEn;
  final String? feedbackMessageHi;
  final Map<String, dynamic>? nextState;

  const ValidationResult({
    required this.isCorrect,
    this.feedbackMessageEn,
    this.feedbackMessageHi,
    this.nextState,
  });

  static const ValidationResult success = ValidationResult(isCorrect: true);
  static const ValidationResult failure = ValidationResult(isCorrect: false);
}

class PuzzleEngine {
  /// Validate user answer/interaction against level definition
  static ValidationResult validate({
    required PuzzleLevel level,
    required dynamic userInteraction,
  }) {
    switch (level.interactionType) {
      case InteractionType.multipleChoice:
        return _validateChoice(level, userInteraction);
      case InteractionType.tap:
        return _validateTap(level, userInteraction);
      case InteractionType.dragDrop:
        return _validateDragDrop(level, userInteraction);
      case InteractionType.positioning:
        return _validatePositioning(level, userInteraction);
      case InteractionType.multiStep:
        return _validateMultiStep(level, userInteraction);
      case InteractionType.patternObservation:
        return _validatePatternObservation(level, userInteraction);
      case InteractionType.timedMemory:
        return _validateTimedMemory(level, userInteraction);
    }
  }

  static ValidationResult _validateChoice(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (userInteraction is int) {
      if (level.solutionIndex != null &&
          userInteraction == level.solutionIndex) {
        return ValidationResult.success;
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validateTap(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (level.targetSequence != null) {
      if (userInteraction is List<int>) {
        if (userInteraction.length == level.targetSequence!.length) {
          for (int i = 0; i < userInteraction.length; i++) {
            if (userInteraction[i] != level.targetSequence![i]) {
              return ValidationResult.failure;
            }
          }
          return ValidationResult.success;
        }
      }
      return ValidationResult.failure;
    } else if (level.solutionIndex != null) {
      if (userInteraction is int && userInteraction == level.solutionIndex) {
        return ValidationResult.success;
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validateDragDrop(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (userInteraction is Map<String, String>) {
      final source = userInteraction['source'];
      final target = userInteraction['target'];
      if (source == level.dragSourceId && target == level.dragTargetId) {
        return ValidationResult.success;
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validatePositioning(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (userInteraction is Map<String, double>) {
      final target = level.positionTarget;
      if (target != null) {
        // Targets are normalized to the play area (0..1) so a level is
        // solvable on every screen size.
        final double targetX = (target['x'] as num).toDouble();
        final double targetY = (target['y'] as num).toDouble();
        final double tolerance =
            (target['tolerance'] as num?)?.toDouble() ?? 0.1;

        final double userX = userInteraction['x'] ?? 0.0;
        final double userY = userInteraction['y'] ?? 0.0;

        final distance = sqrt(
          pow(userX - targetX, 2) + pow(userY - targetY, 2),
        );
        if (distance <= tolerance) {
          return ValidationResult.success;
        }
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validateMultiStep(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (userInteraction is Map<String, dynamic>) {
      final currentStep = (userInteraction['step'] as num?)?.toInt() ?? 0;
      final totalSteps = (level.extraData?['totalSteps'] as num?)?.toInt() ?? 1;
      final isFinalStep = userInteraction['isFinal'] as bool? ?? false;

      if (isFinalStep || currentStep >= totalSteps) {
        return ValidationResult.success;
      } else {
        return ValidationResult(
          isCorrect: false,
          nextState: {'step': currentStep + 1},
        );
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validatePatternObservation(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    final expectedAnswer = level.extraData?['answer'];
    if (expectedAnswer != null) {
      if (userInteraction.toString().trim().toLowerCase() ==
          expectedAnswer.toString().trim().toLowerCase()) {
        return ValidationResult.success;
      }
    } else if (level.solutionIndex != null && userInteraction is int) {
      if (userInteraction == level.solutionIndex) {
        return ValidationResult.success;
      }
    }
    return ValidationResult.failure;
  }

  static ValidationResult _validateTimedMemory(
    PuzzleLevel level,
    dynamic userInteraction,
  ) {
    if (userInteraction is List<int> && level.targetSequence != null) {
      if (userInteraction.length == level.targetSequence!.length) {
        for (int i = 0; i < userInteraction.length; i++) {
          if (userInteraction[i] != level.targetSequence![i]) {
            return ValidationResult.failure;
          }
        }
        return ValidationResult.success;
      }
    }
    return ValidationResult.failure;
  }
}
