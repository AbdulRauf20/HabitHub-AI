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
