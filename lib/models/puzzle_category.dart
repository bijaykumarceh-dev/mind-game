import 'package:flutter/material.dart';

/// Level categories for filtering and progressive themes.
enum PuzzleCategory {
  logic,
  observation,
  trickPhysics,
  mathNumbers,
  patternRecognition,
  memoryTimed,
  multiStepMaster,
  positioning,
}

extension PuzzleCategoryExtension on PuzzleCategory {
  String get nameEn {
    switch (this) {
      case PuzzleCategory.logic:
        return 'Logic & Brain';
      case PuzzleCategory.observation:
        return 'Eagle Eye';
      case PuzzleCategory.trickPhysics:
        return 'Trick & Physics';
      case PuzzleCategory.mathNumbers:
        return 'Math & Riddles';
      case PuzzleCategory.patternRecognition:
        return 'Patterns';
      case PuzzleCategory.memoryTimed:
        return 'Memory & Speed';
      case PuzzleCategory.multiStepMaster:
        return 'Multi-Step Master';
      case PuzzleCategory.positioning:
        return 'Spatial & Positioning';
    }
  }

  String get nameHi {
    switch (this) {
      case PuzzleCategory.logic:
        return 'तर्क और दिमाग';
      case PuzzleCategory.observation:
        return 'तेज़ नज़र';
      case PuzzleCategory.trickPhysics:
        return 'ट्रिक और भौतिकी';
      case PuzzleCategory.mathNumbers:
        return 'गणित और पहेलियां';
      case PuzzleCategory.patternRecognition:
        return 'पैटर्न और डिज़ाइन';
      case PuzzleCategory.memoryTimed:
        return 'याददाश्त और गति';
      case PuzzleCategory.multiStepMaster:
        return 'मल्टी-स्टेप मास्टर';
      case PuzzleCategory.positioning:
        return 'स्थानिक और स्थिति';
    }
  }

  /// Icon used anywhere a category needs a quick visual cue.
  IconData get icon {
    switch (this) {
      case PuzzleCategory.logic:
        return Icons.psychology_alt_rounded;
      case PuzzleCategory.observation:
        return Icons.visibility_rounded;
      case PuzzleCategory.trickPhysics:
        return Icons.auto_awesome_rounded;
      case PuzzleCategory.mathNumbers:
        return Icons.calculate_rounded;
      case PuzzleCategory.patternRecognition:
        return Icons.grid_view_rounded;
      case PuzzleCategory.memoryTimed:
        return Icons.timer_rounded;
      case PuzzleCategory.multiStepMaster:
        return Icons.stairs_rounded;
      case PuzzleCategory.positioning:
        return Icons.open_with_rounded;
    }
  }
}
