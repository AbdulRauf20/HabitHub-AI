import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChallengeTaskModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final int displayOrder;
  final int xpReward;
  final bool isRequired;
  final int estimatedMinutes;
  final bool isArchived;
  final Timestamp createdAt;

  const ChallengeTaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.displayOrder,
    required this.xpReward,
    required this.isRequired,
    required this.estimatedMinutes,
    required this.isArchived,
    required this.createdAt,
  });

  ChallengeTaskModel copyWith({
    String? id,
    String? title,
    String? description,
    int? displayOrder,
    int? xpReward,
    bool? isRequired,
    int? estimatedMinutes,
    bool? isArchived,
    Timestamp? createdAt,
  }) {
    return ChallengeTaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      displayOrder: displayOrder ?? this.displayOrder,
      xpReward: xpReward ?? this.xpReward,
      isRequired: isRequired ?? this.isRequired,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChallengeTaskModel.fromMap(Map<String, dynamic> map) {
    return ChallengeTaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      displayOrder: map['displayOrder'] ?? 0,
      xpReward: map['xpReward'] ?? 0,
      isRequired: map['isRequired'] ?? true,
      estimatedMinutes: map['estimatedMinutes'] ?? 0,
      isArchived: map['isArchived'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'displayOrder': displayOrder,
      'xpReward': xpReward,
      'isRequired': isRequired,
      'estimatedMinutes': estimatedMinutes,
      'isArchived': isArchived,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        displayOrder,
        xpReward,
        isRequired,
        estimatedMinutes,
        isArchived,
        createdAt,
      ];
}