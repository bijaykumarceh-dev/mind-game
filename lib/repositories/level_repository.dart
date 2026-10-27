import '../models/interaction_type.dart';
import '../models/puzzle_category.dart';
import '../models/puzzle_level.dart';
import '../puzzle_engine/level_data/level_data_1_to_25.dart';
import '../puzzle_engine/level_data/level_data_26_to_50.dart';
import '../puzzle_engine/level_data/level_data_51_to_75.dart';
import '../puzzle_engine/level_data/level_data_76_to_100.dart';

class LevelRepository {
  late final List<PuzzleLevel> _allLevels;

  LevelRepository() {
    _allLevels = [
      ...levels1To25,
      ...levels26To50,
      ...levels51To75,
      ...levels76To100,
    ];

    final errors = validateBundledLevels(_allLevels);
    if (errors.isNotEmpty) {
      throw StateError('Invalid bundled puzzle data:\n${errors.join('\n')}');
    }
  }

  List<PuzzleLevel> get allLevels => List.unmodifiable(_allLevels);

  int get totalLevels => _allLevels.length;

  PuzzleLevel getLevelById(int id) {
    return _allLevels.firstWhere(
      (level) => level.id == id,
      orElse: () => throw ArgumentError.value(id, 'id', 'Unknown puzzle level'),
    );
  }

  List<PuzzleLevel> getLevelsByCategory(PuzzleCategory category) {
    return _allLevels.where((level) => level.category == category).toList();
  }

  static List<String> validateBundledLevels(List<PuzzleLevel> levels) {
    final errors = <String>[];
    if (levels.length != 100) {
      errors.add('Expected 100 levels, found ${levels.length}.');
    }
    final seenIds = <int>{};
    for (final level in levels) {
      final prefix = 'Level ${level.id}';
      if (!seenIds.add(level.id)) errors.add('$prefix has a duplicate ID.');
      if (level.id < 1 || level.id > 100) {
        errors.add('$prefix ID must be between 1 and 100.');
      }
      if (level.questionEn.trim().isEmpty || level.questionHi.trim().isEmpty) {
        errors.add('$prefix is missing a localized question.');
      }
      if (level.instructionEn.trim().isEmpty ||
          level.instructionHi.trim().isEmpty) {
        errors.add('$prefix is missing localized instructions.');
      }
      if (level.explanationEn.trim().isEmpty ||
          level.explanationHi.trim().isEmpty) {
        errors.add('$prefix is missing a localized explanation.');
      }
      if (level.hintsEn.length < 3 || level.hintsHi.length < 3) {
        errors.add('$prefix must have at least three hints per language.');
      }
      if (level.rewardCoins < 0) errors.add('$prefix has a negative reward.');
      if (level.assetReferences.any((reference) => reference.trim().isEmpty)) {
        errors.add('$prefix contains an empty asset reference.');
      }
      switch (level.interactionType) {
        case InteractionType.multipleChoice:
          final options = level.options;
          if (options == null ||
              options.isEmpty ||
              level.solutionIndex == null ||
              level.solutionIndex! < 0 ||
              level.solutionIndex! >= options.length) {
            errors.add('$prefix has an invalid multiple-choice answer.');
          }
          break;
        case InteractionType.tap:
          if (level.targetSequence == null && level.solutionIndex == null) {
            errors.add('$prefix has no tap answer.');
          }
          break;
        case InteractionType.dragDrop:
          if (level.dragSourceId == null || level.dragTargetId == null) {
            errors.add('$prefix has an incomplete drag-and-drop answer.');
          }
          break;
        case InteractionType.positioning:
          final target = level.positionTarget;
          if (target == null || target['x'] is! num || target['y'] is! num) {
            errors.add('$prefix has an invalid position target.');
          }
          break;
        case InteractionType.multiStep:
          final steps = (level.extraData?['totalSteps'] as num?)?.toInt() ?? 3;
          if (steps < 1) errors.add('$prefix has an invalid step count.');
          break;
        case InteractionType.patternObservation:
          final answer = level.extraData?['answer'];
          final hasChoice = level.options?.isNotEmpty == true &&
              level.solutionIndex != null;
          if (!hasChoice && (answer == null || answer.toString().isEmpty)) {
            errors.add('$prefix has no pattern answer.');
          }
          break;
        case InteractionType.timedMemory:
          if (level.targetSequence == null || level.targetSequence!.isEmpty) {
            errors.add('$prefix has no memory sequence.');
          }
          break;
      }
    }
    return errors;
  }
}
