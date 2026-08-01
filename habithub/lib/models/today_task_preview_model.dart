import 'package:equatable/equatable.dart';

class TodayTaskPreviewModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  const TodayTaskPreviewModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  TodayTaskPreviewModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodayTaskPreviewModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TodayTaskPreviewModel.fromMap(Map<String, dynamic> map) {
    return TodayTaskPreviewModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
