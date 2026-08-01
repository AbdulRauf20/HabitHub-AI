import 'package:cloud_firestore/cloud_firestore.dart';

class TaskProgressModel {
  final String date;
  final Map<String, bool> completedTasks;
  final Timestamp? completedAt;

  const TaskProgressModel({
    required this.date,
    required this.completedTasks,
    this.completedAt,
  });

  factory TaskProgressModel.fromMap(Map<String, dynamic> map) {
    final rawTasks = map['completedTasks'];

    final completedTasks = <String, bool>{};

    if (rawTasks is Map) {
      rawTasks.forEach((key, value) {
        completedTasks[key.toString()] = value == true;
      });
    }

    return TaskProgressModel(
      date: map['date'] ?? '',
      completedTasks: completedTasks,
      completedAt: map['completedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'completedTasks': completedTasks,
      'completedAt': completedAt,
    };
  }
}
