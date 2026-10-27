import 'dart:convert';

class UserProgress {
  int unlockedLevelMax;
  Set<int> completedLevelIds;
  Map<int, int> levelStars;
  int coins;
  bool isAdsRemoved;
  int hintsInventory;
  int lastDailyClaimEpoch;
  int dailyStreak;
  int totalAnswers;
  int wrongAnswers;
  int noHintClears;
  List<int> claimedDays;

  UserProgress({
    this.unlockedLevelMax = 1,
    Set<int>? completedLevelIds,
    Map<int, int>? levelStars,
    this.coins = 50,
    this.isAdsRemoved = false,
    this.hintsInventory = 3,
    this.lastDailyClaimEpoch = 0,
    this.dailyStreak = 0,
    this.totalAnswers = 0,
    this.wrongAnswers = 0,
    this.noHintClears = 0,
    List<int>? claimedDays,
  }) : completedLevelIds = completedLevelIds ?? {},
       levelStars = levelStars ?? {},
       claimedDays = claimedDays ?? [];

  bool isLevelUnlocked(int levelId) => levelId <= unlockedLevelMax;

  bool isLevelCompleted(int levelId) => completedLevelIds.contains(levelId);

  int getStars(int levelId) => levelStars[levelId] ?? 0;

  int get totalStars =>
      levelStars.values.fold<int>(0, (sum, count) => sum + count);

  /// Percentage of submitted answers that were correct, or null when the
  /// player has not answered anything yet.
  double? get answerAccuracy {
    if (totalAnswers <= 0) return null;
    final correct = totalAnswers - wrongAnswers;
    return correct * 100 / totalAnswers;
  }

  Map<String, dynamic> toJson() => {
    'unlockedLevelMax': unlockedLevelMax,
    'completedLevelIds': completedLevelIds.toList(),
    'levelStars': levelStars.map((k, v) => MapEntry(k.toString(), v)),
    'coins': coins,
    'isAdsRemoved': isAdsRemoved,
    'hintsInventory': hintsInventory,
    'lastDailyClaimEpoch': lastDailyClaimEpoch,
    'dailyStreak': dailyStreak,
    'totalAnswers': totalAnswers,
    'wrongAnswers': wrongAnswers,
    'noHintClears': noHintClears,
    'claimedDays': claimedDays,
  };

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    final completedList =
        (json['completedLevelIds'] as List?)?.cast<int>() ?? [];
    final starsRaw = (json['levelStars'] as Map<String, dynamic>?) ?? {};
    final stars = starsRaw.map(
      (k, v) => MapEntry(int.parse(k), (v as num).toInt()),
    );

    return UserProgress(
      unlockedLevelMax: (json['unlockedLevelMax'] as num?)?.toInt() ?? 1,
      completedLevelIds: completedList.toSet(),
      levelStars: stars,
      coins: (json['coins'] as num?)?.toInt() ?? 50,
      isAdsRemoved: json['isAdsRemoved'] as bool? ?? false,
      hintsInventory: (json['hintsInventory'] as num?)?.toInt() ?? 3,
      lastDailyClaimEpoch: (json['lastDailyClaimEpoch'] as num?)?.toInt() ?? 0,
      dailyStreak: (json['dailyStreak'] as num?)?.toInt() ?? 0,
      totalAnswers: (json['totalAnswers'] as num?)?.toInt() ?? 0,
      wrongAnswers: (json['wrongAnswers'] as num?)?.toInt() ?? 0,
      noHintClears: (json['noHintClears'] as num?)?.toInt() ?? 0,
      claimedDays:
          (json['claimedDays'] as List?)?.cast<int>().toList() ?? <int>[],
    );
  }

  String encode() => jsonEncode(toJson());

  factory UserProgress.decode(String str) {
    try {
      return UserProgress.fromJson(jsonDecode(str) as Map<String, dynamic>);
    } catch (_) {
      return UserProgress();
    }
  }

  /// Parses exported progress and returns null for anything invalid, so a
  /// bad paste can never wipe the player's real save data.
  static UserProgress? tryParse(String str) {
    try {
      final decoded = jsonDecode(str);
      if (decoded is! Map<String, dynamic>) return null;
      return UserProgress.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }
}
