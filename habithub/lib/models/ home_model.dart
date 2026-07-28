class HomeModel {
  final String fullName;
  final int currentStreak;
  final int longestStreak;
  final int xp;
  final int level;
  final String badge;

  const HomeModel({
    required this.fullName,
    required this.currentStreak,
    required this.longestStreak,
    required this.xp,
    required this.level,
    required this.badge,
  });

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      fullName: map['fullName'] ?? '',
      currentStreak: map['currentStreak'] ?? 0,
      longestStreak: map['longestStreak'] ?? 0,
      xp: map['xp'] ?? 0,
      level: map['level'] ?? 1,
      badge: map['badge'] ?? 'Beginner',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'xp': xp,
      'level': level,
      'badge': badge,
    };
  }
}