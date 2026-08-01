import 'package:cloud_firestore/cloud_firestore.dart';

class JoinedChallengeModel {
  final String challengeId;
  final Timestamp joinedAt;
  final Timestamp startDate;
  final int currentDay;
  final int completedDays;
  final int currentStreak;
  final int longestStreak;
  final double progress;
  final String status;
  final Timestamp? lastCompletedDate;

  const JoinedChallengeModel({
    required this.challengeId,
    required this.joinedAt,
    required this.startDate,
    required this.currentDay,
    required this.completedDays,
    required this.currentStreak,
    required this.longestStreak,
    required this.progress,
    required this.status,
    this.lastCompletedDate,
  });

  factory JoinedChallengeModel.fromMap(Map<String, dynamic> map) {
    return JoinedChallengeModel(
      challengeId: map['challengeId'] ?? '',
      joinedAt: map['joinedAt'] ?? Timestamp.now(),
      startDate: map['startDate'] ?? Timestamp.now(),
      currentDay: map['currentDay'] ?? 0,
      completedDays: map['completedDays'] ?? 0,
      currentStreak: map['currentStreak'] ?? 0,
      longestStreak: map['longestStreak'] ?? 0,
      progress: (map['progress'] ?? 0).toDouble(),
      status: map['status'] ?? 'active',
      lastCompletedDate: map['lastCompletedDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'challengeId': challengeId,
      'joinedAt': joinedAt,
      'startDate': startDate,
      'currentDay': currentDay,
      'completedDays': completedDays,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'progress': progress,
      'status': status,
      'lastCompletedDate': lastCompletedDate,
    };
  }
}
