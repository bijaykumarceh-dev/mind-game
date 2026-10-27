import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/models/achievement.dart';
import 'package:mind_twist/models/user_progress.dart';
import 'package:mind_twist/repositories/level_repository.dart';
import 'package:mind_twist/services/audio_service.dart';
import 'package:mind_twist/services/persistence_service.dart';
import 'package:mind_twist/viewmodels/daily_challenge_viewmodel.dart';
import 'package:mind_twist/viewmodels/user_progress_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Answer accuracy tracking', () {
    late PersistenceService persistence;
    late UserProgressViewModel viewModel;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      persistence = await PersistenceService.init();
      viewModel = UserProgressViewModel(persistence, AudioService());
    });

    test('Starts with no answers and no accuracy value', () {
      expect(viewModel.totalAnswers, 0);
      expect(viewModel.wrongAnswers, 0);
      expect(viewModel.progress.answerAccuracy, isNull);
    });

    test('Mixed answers produce the real accuracy percentage', () {
      viewModel.recordAnswer(isCorrect: true);
      viewModel.recordAnswer(isCorrect: false);
      viewModel.recordAnswer(isCorrect: true);
      viewModel.recordAnswer(isCorrect: false);

      expect(viewModel.totalAnswers, 4);
      expect(viewModel.wrongAnswers, 2);
      expect(viewModel.progress.answerAccuracy, closeTo(50.0, 0.001));

      final reloaded = persistence.loadProgress();
      expect(reloaded.totalAnswers, 4);
      expect(reloaded.wrongAnswers, 2);
    });

    test('No-hint three star clears are counted once per level', () {
      expect(viewModel.completeLevel(1, 10, 3), isTrue);
      expect(viewModel.completeLevel(2, 10, 3), isTrue);
      expect(viewModel.completeLevel(3, 10, 1), isTrue);
      expect(viewModel.noHintClears, 2);

      // Replaying does not increase the counter.
      viewModel.completeLevel(1, 10, 3);
      expect(viewModel.noHintClears, 2);
    });
  });

  group('Progress export and import', () {
    late PersistenceService persistence;
    late UserProgressViewModel viewModel;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      persistence = await PersistenceService.init();
      viewModel = UserProgressViewModel(persistence, AudioService());
    });

    test('Exported progress round-trips through import', () {
      viewModel.recordAnswer(isCorrect: true);
      viewModel.completeLevel(1, 10, 3);

      final exported = viewModel.exportProgress();
      final fresh = UserProgressViewModel(persistence, AudioService());

      expect(fresh.importProgress(exported), isTrue);
      expect(fresh.progress.completedLevelIds, {1});
      expect(fresh.coins, 60);
      expect(fresh.noHintClears, 1);
    });

    test('Invalid payloads are rejected and the save is untouched', () {
      viewModel.completeLevel(1, 10, 3);
      final coinsBefore = viewModel.coins;

      expect(viewModel.importProgress('not json at all'), isFalse);
      expect(viewModel.importProgress('[1, 2, 3]'), isFalse);
      expect(viewModel.importProgress('   '), isFalse);

      expect(viewModel.coins, coinsBefore);
      expect(viewModel.progress.completedLevelIds, {1});
    });

    test('tryParse returns null for garbage', () {
      expect(UserProgress.tryParse('nope'), isNull);
      expect(UserProgress.tryParse('{"coins": "lots"}'), isNull);
      expect(UserProgress.tryParse('42'), isNull);
    });
  });

  group('Daily challenge claims', () {
    test('Claiming records the day, streak, rewards and history', () async {
      SharedPreferences.setMockInitialValues({});
      final persistence = await PersistenceService.init();
      final viewModel = UserProgressViewModel(persistence, AudioService());
      final daily = DailyChallengeViewModel(
        userProgressVM: viewModel,
        levelRepository: LevelRepository(),
      );

      final nowDays =
          DateTime.now().millisecondsSinceEpoch ~/ (1000 * 60 * 60 * 24);

      expect(daily.todaysLevelId, inInclusiveRange(1, 100));
      expect(daily.canClaimToday, isTrue);
      expect(daily.claimDailyReward(), isTrue);

      expect(
        daily.canClaimToday,
        isFalse,
        reason: 'The reward can only be claimed once per day',
      );
      expect(daily.claimDailyReward(), isFalse);
      expect(viewModel.progress.claimedDays, contains(nowDays));
      expect(viewModel.progress.dailyStreak, 1);
      expect(viewModel.coins, 100);
      expect(viewModel.hintsInventory, 4);

      final history = daily.recentClaimHistory();
      expect(history, hasLength(30));
      expect(history.first.day, nowDays);
      expect(history.first.claimed, isTrue);
      expect(history.last.claimed, isFalse);

      final reloaded = persistence.loadProgress();
      expect(reloaded.claimedDays, contains(nowDays));
    });
  });

  group('Achievements', () {
    test('Nothing is unlocked on a fresh profile', () {
      final achievements = evaluateAchievements(UserProgress());
      expect(achievements, isNotEmpty);
      expect(achievements.every((a) => !a.unlocked), isTrue);
    });

    test('Clearing levels unlocks the matching badges', () {
      final progress = UserProgress();
      progress.completedLevelIds.addAll({1, 2, 3});
      progress.levelStars.addAll({1: 3, 2: 3, 3: 3});

      final byTitle = {
        for (final a in evaluateAchievements(progress)) a.titleKey: a,
      };
      expect(byTitle['ach_first_title']!.unlocked, isTrue);
      expect(byTitle['ach_10_title']!.unlocked, isFalse);
      expect(byTitle['ach_10_title']!.fraction, closeTo(0.3, 0.001));
      expect(byTitle['ach_stars_title']!.current, 9);
    });

    test('Streak and coin badges use the saved values', () {
      final progress = UserProgress()
        ..dailyStreak = 7
        ..coins = 750;
      final byTitle = {
        for (final a in evaluateAchievements(progress)) a.titleKey: a,
      };
      expect(byTitle['ach_streak_title']!.unlocked, isTrue);
      expect(byTitle['ach_coins_title']!.unlocked, isTrue);
      expect(byTitle['ach_coins_title']!.fraction, 1.0);
    });
  });
}
