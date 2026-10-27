import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/models/user_progress.dart';
import 'package:mind_twist/services/persistence_service.dart';
import 'package:mind_twist/services/audio_service.dart';
import 'package:mind_twist/viewmodels/user_progress_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('User Progress & Persistence Tests', () {
    late PersistenceService persistence;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      persistence = await PersistenceService.init();
    });

    test(
      'Initial user progress has 50 coins, 3 hints, and Level 1 unlocked',
      () {
        final progress = persistence.loadProgress();
        expect(progress.coins, equals(50));
        expect(progress.hintsInventory, equals(3));
        expect(progress.unlockedLevelMax, equals(1));
        expect(progress.isLevelUnlocked(1), isTrue);
        expect(progress.isLevelUnlocked(2), isFalse);
      },
    );

    test('Saving and loading progress persists state changes', () async {
      final progress = persistence.loadProgress();
      progress.coins += 100;
      progress.unlockedLevelMax = 5;
      progress.completedLevelIds.add(1);
      progress.completedLevelIds.add(2);

      await persistence.saveProgress(progress);

      final reloaded = persistence.loadProgress();
      expect(reloaded.coins, equals(150));
      expect(reloaded.unlockedLevelMax, equals(5));
      expect(reloaded.isLevelCompleted(1), isTrue);
      expect(reloaded.isLevelCompleted(2), isTrue);
      expect(reloaded.isLevelCompleted(3), isFalse);
    });

    test('Single reward grant enforcement prevents duplicate rewards', () {
      final progress = UserProgress();
      const int levelId = 3;
      const int reward = 10;

      // First completion: grant reward
      if (!progress.isLevelCompleted(levelId)) {
        progress.completedLevelIds.add(levelId);
        progress.coins += reward;
        if (progress.unlockedLevelMax < levelId + 1) {
          progress.unlockedLevelMax = levelId + 1;
        }
      }

      expect(progress.coins, equals(60));
      expect(progress.unlockedLevelMax, equals(4));

      // Repeated attempt/completion: reward MUST NOT be granted again
      if (!progress.isLevelCompleted(levelId)) {
        progress.coins += reward;
      }

      expect(progress.coins, equals(60)); // Coins remained 60!
    });

    test('View model grants completion reward once and retains best stars', () {
      WidgetsFlutterBinding.ensureInitialized();
      final viewModel = UserProgressViewModel(persistence, AudioService());
      expect(viewModel.completeLevel(1, 10, 2), isTrue);
      expect(viewModel.completeLevel(1, 10, 3), isFalse);
      expect(viewModel.coins, equals(60));
      expect(viewModel.getStars(1), equals(3));
      expect(viewModel.unlockedLevelMax, equals(2));
    });
  });
}
