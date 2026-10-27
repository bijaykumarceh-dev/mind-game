import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/models/interaction_type.dart';
import 'package:mind_twist/puzzle_engine/validators/validators.dart';
import 'package:mind_twist/repositories/level_repository.dart';

void main() {
  group('Puzzle Level Repository & Engine Validation Tests', () {
    late LevelRepository repository;

    setUp(() {
      repository = LevelRepository();
    });

    test(
      'LevelRepository loads exactly 100 levels with unique IDs 1 to 100',
      () {
        expect(repository.totalLevels, equals(100));
        final ids = repository.allLevels.map((l) => l.id).toSet();
        expect(ids.length, equals(100));
        expect(ids.contains(1), isTrue);
        expect(ids.contains(100), isTrue);
        expect(
          LevelRepository.validateBundledLevels(repository.allLevels),
          isEmpty,
        );
        expect(() => repository.getLevelById(101), throwsArgumentError);
      },
    );

    test('All 100 levels have valid questions, hints, and localizations', () {
      for (final level in repository.allLevels) {
        expect(
          level.questionEn.isNotEmpty,
          isTrue,
          reason: 'Level ${level.id} missing questionEn',
        );
        expect(
          level.questionHi.isNotEmpty,
          isTrue,
          reason: 'Level ${level.id} missing questionHi',
        );
        expect(
          level.hintsEn.length,
          greaterThanOrEqualTo(3),
          reason: 'Level ${level.id} missing hintsEn',
        );
        expect(
          level.hintsHi.length,
          greaterThanOrEqualTo(3),
          reason: 'Level ${level.id} missing hintsHi',
        );
        expect(
          level.explanationEn.isNotEmpty,
          isTrue,
          reason: 'Level ${level.id} missing explanationEn',
        );
        expect(
          level.explanationHi.isNotEmpty,
          isTrue,
          reason: 'Level ${level.id} missing explanationHi',
        );
      }
    });

    test('MultipleChoice levels evaluate correct choice', () {
      final choiceLevels = repository.allLevels.where(
        (l) => l.interactionType == InteractionType.multipleChoice,
      );
      for (final level in choiceLevels) {
        expect(
          level.solutionIndex,
          isNotNull,
          reason: 'Level ${level.id} choice level has null solutionIndex',
        );

        // Correct answer check
        final correctResult = PuzzleEngine.validate(
          level: level,
          userInteraction: level.solutionIndex,
        );
        expect(
          correctResult.isCorrect,
          isTrue,
          reason: 'Level ${level.id} failed valid solutionIndex test',
        );

        // Wrong answer check
        final wrongIndex = (level.solutionIndex! + 1) % 4;
        final wrongResult = PuzzleEngine.validate(
          level: level,
          userInteraction: wrongIndex,
        );
        expect(
          wrongResult.isCorrect,
          isFalse,
          reason: 'Level ${level.id} passed invalid solutionIndex',
        );
      }
    });

    test('DragDrop levels evaluate correct drag source & target', () {
      final dragLevels = repository.allLevels.where(
        (l) => l.interactionType == InteractionType.dragDrop,
      );
      for (final level in dragLevels) {
        expect(
          level.dragSourceId,
          isNotNull,
          reason: 'Level ${level.id} drag level has null dragSourceId',
        );
        expect(
          level.dragTargetId,
          isNotNull,
          reason: 'Level ${level.id} drag level has null dragTargetId',
        );

        final correctPayload = {
          'source': level.dragSourceId!,
          'target': level.dragTargetId!,
        };
        final res = PuzzleEngine.validate(
          level: level,
          userInteraction: correctPayload,
        );
        expect(
          res.isCorrect,
          isTrue,
          reason: 'Level ${level.id} failed valid drag test',
        );
      }
    });

    test('Positioning levels evaluate target bounds tolerance', () {
      final posLevels = repository.allLevels.where(
        (l) => l.interactionType == InteractionType.positioning,
      );
      for (final level in posLevels) {
        expect(
          level.positionTarget,
          isNotNull,
          reason: 'Level ${level.id} positioning level has null target',
        );

        final double tx = (level.positionTarget!['x'] as num).toDouble();
        final double ty = (level.positionTarget!['y'] as num).toDouble();

        final correctPayload = {'x': tx, 'y': ty};
        final res = PuzzleEngine.validate(
          level: level,
          userInteraction: correctPayload,
        );
        expect(
          res.isCorrect,
          isTrue,
          reason: 'Level ${level.id} failed valid position test',
        );
      }
    });

    test('Every bundled puzzle accepts its interaction-specific solution', () {
      for (final level in repository.allLevels) {
        dynamic answer;
        switch (level.interactionType) {
          case InteractionType.multipleChoice:
            answer = level.solutionIndex;
            break;
          case InteractionType.tap:
            answer = level.targetSequence ?? level.solutionIndex;
            break;
          case InteractionType.dragDrop:
            answer = {
              'source': level.dragSourceId!,
              'target': level.dragTargetId!,
            };
            break;
          case InteractionType.positioning:
            answer = {
              'x': (level.positionTarget!['x'] as num).toDouble(),
              'y': (level.positionTarget!['y'] as num).toDouble(),
            };
            break;
          case InteractionType.multiStep:
            final steps =
                (level.extraData?['totalSteps'] as num?)?.toInt() ?? 3;
            answer = {'step': steps, 'isFinal': true};
            break;
          case InteractionType.patternObservation:
            answer = level.extraData?['answer'] ?? level.solutionIndex;
            break;
          case InteractionType.timedMemory:
            answer = level.targetSequence;
            break;
        }
        expect(
          PuzzleEngine.validate(
            level: level,
            userInteraction: answer,
          ).isCorrect,
          isTrue,
          reason: 'Level ${level.id} rejected its bundled solution.',
        );
      }
    });
  });
}
