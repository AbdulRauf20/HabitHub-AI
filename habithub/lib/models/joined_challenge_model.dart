import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:habithub/models/task_progress_model.dart';

class JoinedChallengeModel extends Equatable {
  final String challengeId;
  final Timestamp joinedAt;

  final String status;

  final int currentDay;
  final int currentStreak;
  final int completedDays;

  final double completionPercentage;

  final int earnedXP;
  final int earnedCoins;

  final Timestamp? lastCompleted;

  final List<TaskProgressModel> taskProgress;

  const JoinedChallengeModel({
    required this.challengeId,
    required this.joinedAt,
    required this.status,
    required this.currentDay,
    required this.currentStreak,
    required this.completedDays,
    required this.completionPercentage,
    required this.earnedXP,
    required this.earnedCoins,
    this.lastCompleted,
    required this.taskProgress,
  });

  JoinedChallengeModel copyWith({
    String? challengeId,
    Timestamp? joinedAt,
    String? status,
    int? currentDay,
    int? currentStreak,
    int? completedDays,
    double? completionPercentage,
    int? earnedXP,
    int? earnedCoins,
    Timestamp? lastCompleted,
    List<TaskProgressModel>? taskProgress,
  }) {
    return JoinedChallengeModel(
      challengeId: challengeId ?? this.challengeId,
      joinedAt: joinedAt ?? this.joinedAt,
      status: status ?? this.status,
      currentDay: currentDay ?? this.currentDay,
      currentStreak: currentStreak ?? this.currentStreak,
      completedDays: completedDays ?? this.completedDays,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      earnedXP: earnedXP ?? this.earnedXP,
      earnedCoins: earnedCoins ?? this.earnedCoins,
      lastCompleted: lastCompleted ?? this.lastCompleted,
      taskProgress: taskProgress ?? this.taskProgress,
    );
  }

  factory JoinedChallengeModel.fromMap(Map<String, dynamic> map) {
    return JoinedChallengeModel(
      challengeId: map['challengeId'] ?? '',
      joinedAt: map['joinedAt'] ?? Timestamp.now(),
      status: map['status'] ?? 'Active',
      currentDay: map['currentDay'] ?? 1,
      currentStreak: map['currentStreak'] ?? 0,
      completedDays: map['completedDays'] ?? 0,
      completionPercentage: (map['completionPercentage'] ?? 0).toDouble(),
      earnedXP: map['earnedXP'] ?? 0,
      earnedCoins: map['earnedCoins'] ?? 0,
      lastCompleted: map['lastCompleted'],
      taskProgress: (map['taskProgress'] as List<dynamic>? ?? [])
          .map((e) => TaskProgressModel.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'challengeId': challengeId,
      'joinedAt': joinedAt,
      'status': status,
      'currentDay': currentDay,
      'currentStreak': currentStreak,
      'completedDays': completedDays,
      'completionPercentage': completionPercentage,
      'earnedXP': earnedXP,
      'earnedCoins': earnedCoins,
      'lastCompleted': lastCompleted,
      'taskProgress': taskProgress.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    challengeId,
    joinedAt,
    status,
    currentDay,
    currentStreak,
    completedDays,
    completionPercentage,
    earnedXP,
    earnedCoins,
    lastCompleted,
    taskProgress,
  ];
}
