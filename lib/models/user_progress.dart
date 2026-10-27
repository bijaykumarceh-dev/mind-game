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

  UserProgress({
    this.unlockedLevelMax = 1,
    Set<int>? completedLevelIds,
    Map<int, int>? levelStars,
    this.coins = 50,
    this.isAdsRemoved = false,
    this.hintsInventory = 3,
    this.lastDailyClaimEpoch = 0,
    this.dailyStreak = 0,
  })  : completedLevelIds = completedLevelIds ?? {},
        levelStars = levelStars ?? {};

  bool isLevelUnlocked(int levelId) => levelId <= unlockedLevelMax;

  bool isLevelCompleted(int levelId) => completedLevelIds.contains(levelId);

  int getStars(int levelId) => levelStars[levelId] ?? 0;

  Map<String, dynamic> toJson() => {
        'unlockedLevelMax': unlockedLevelMax,
        'completedLevelIds': completedLevelIds.toList(),
        'levelStars': levelStars.map((k, v) => MapEntry(k.toString(), v)),
        'coins': coins,
        'isAdsRemoved': isAdsRemoved,
        'hintsInventory': hintsInventory,
        'lastDailyClaimEpoch': lastDailyClaimEpoch,
        'dailyStreak': dailyStreak,
      };

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    final completedList = (json['completedLevelIds'] as List?)?.cast<int>() ?? [];
    final starsRaw = (json['levelStars'] as Map<String, dynamic>?) ?? {};
    final stars = starsRaw.map((k, v) => MapEntry(int.parse(k), (v as num).toInt()));

    return UserProgress(
      unlockedLevelMax: (json['unlockedLevelMax'] as num?)?.toInt() ?? 1,
      completedLevelIds: completedList.toSet(),
      levelStars: stars,
      coins: (json['coins'] as num?)?.toInt() ?? 50,
      isAdsRemoved: json['isAdsRemoved'] as bool? ?? false,
      hintsInventory: (json['hintsInventory'] as num?)?.toInt() ?? 3,
      lastDailyClaimEpoch: (json['lastDailyClaimEpoch'] as num?)?.toInt() ?? 0,
      dailyStreak: (json['dailyStreak'] as num?)?.toInt() ?? 0,
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
}
