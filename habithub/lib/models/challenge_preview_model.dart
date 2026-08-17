import 'package:equatable/equatable.dart';

import 'today_task_preview_model.dart';

class ChallengePreviewModel extends Equatable {
  final String challengeId;

  final String title;
  final String description;

  final int currentDay;
  final int totalDays;

  final double progress;

  final int streak;

  final int xpReward;

  final bool isStarted;

  final int daysRemaining;

  final List<TodayTaskPreviewModel> todayTasks;

  const ChallengePreviewModel({
    required this.challengeId,
    required this.title,
    required this.description,
    required this.currentDay,
    required this.totalDays,
    required this.progress,
    required this.streak,
    required this.xpReward,
    required this.isStarted,
    required this.daysRemaining,
    required this.todayTasks,
  });

  factory ChallengePreviewModel.fromMap(Map<String, dynamic> map) {
    return ChallengePreviewModel(
      challengeId: map['challengeId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      currentDay: map['currentDay'] ?? 0,
      totalDays: map['totalDays'] ?? 0,
      progress: (map['progress'] as num?)?.toDouble() ?? 0.0,
      streak: map['streak'] ?? 0,
      xpReward: map['xpReward'] ?? 0,
      isStarted: map['isStarted'] ?? false,
      daysRemaining: map['daysRemaining'] ?? 0,
      todayTasks: (map['todayTasks'] as List<dynamic>?)
              ?.map((e) => TodayTaskPreviewModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'challengeId': challengeId,
      'title': title,
      'description': description,
      'currentDay': currentDay,
      'totalDays': totalDays,
      'progress': progress,
      'streak': streak,
      'xpReward': xpReward,
      'isStarted': isStarted,
      'daysRemaining': daysRemaining,
      'todayTasks': todayTasks.map((task) => task.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    challengeId,
    title,
    description,
    currentDay,
    totalDays,
    progress,
    streak,
    xpReward,
    isStarted,
    daysRemaining,
    todayTasks,
  ];
}
