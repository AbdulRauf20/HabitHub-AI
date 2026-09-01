import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProfileActivityModel extends Equatable {
  final String id;
  final DateTime date;
  final int completedTasks;

  const ProfileActivityModel({
    required this.id,
    required this.date,
    required this.completedTasks,
  });

  factory ProfileActivityModel.fromMap(String id, Map<String, dynamic> map) {
    final timestamp = map['date'];

    DateTime date;

    if (timestamp is Timestamp) {
      date = timestamp.toDate();
    } else if (timestamp is DateTime) {
      date = timestamp;
    } else {
      date = DateTime.now();
    }

    return ProfileActivityModel(
      id: id,
      date: date,
      completedTasks: (map['completedTasks'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {'date': Timestamp.fromDate(date), 'completedTasks': completedTasks};
  }

  @override
  List<Object?> get props => [id, date, completedTasks];
}
