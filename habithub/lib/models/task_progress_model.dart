import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskProgressModel extends Equatable {
  final String taskId;
  final bool completed;
  final Timestamp? completedAt;
  final int earnedXP;

  const TaskProgressModel({
    required this.taskId,
    required this.completed,
    this.completedAt,
    required this.earnedXP,
  });

  TaskProgressModel copyWith({
    String? taskId,
    bool? completed,
    Timestamp? completedAt,
    int? earnedXP,
  }) {
    return TaskProgressModel(
      taskId: taskId ?? this.taskId,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
      earnedXP: earnedXP ?? this.earnedXP,
    );
  }

  factory TaskProgressModel.fromMap(Map<String, dynamic> map) {
    return TaskProgressModel(
      taskId: map['taskId'] ?? '',
      completed: map['completed'] ?? false,
      completedAt: map['completedAt'],
      earnedXP: map['earnedXP'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'completed': completed,
      'completedAt': completedAt,
      'earnedXP': earnedXP,
    };
  }

  @override
  List<Object?> get props => [
        taskId,
        completed,
        completedAt,
        earnedXP,
      ];
}