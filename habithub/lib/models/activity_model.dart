import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final String id;

  final String userId;

  final String type;

  final String title;
  final String description;

  final String? referenceId;

  final int xpEarned;
  final int coinsEarned;

  final Timestamp createdAt;

  const ActivityModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.description,
    this.referenceId,
    required this.xpEarned,
    required this.coinsEarned,
    required this.createdAt,
  });

  ActivityModel copyWith({
    String? id,
    String? userId,
    String? type,
    String? title,
    String? description,
    String? referenceId,
    int? xpEarned,
    int? coinsEarned,
    Timestamp? createdAt,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      referenceId: referenceId ?? this.referenceId,
      xpEarned: xpEarned ?? this.xpEarned,
      coinsEarned: coinsEarned ?? this.coinsEarned,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      referenceId: map['referenceId'],
      xpEarned: map['xpEarned'] ?? 0,
      coinsEarned: map['coinsEarned'] ?? 0,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'title': title,
      'description': description,
      'referenceId': referenceId,
      'xpEarned': xpEarned,
      'coinsEarned': coinsEarned,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    type,
    title,
    description,
    referenceId,
    xpEarned,
    coinsEarned,
    createdAt,
  ];
}
