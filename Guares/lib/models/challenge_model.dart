import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'challenge_task_model.dart';

class ChallengeModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String creatorId;

  final String category;
  final String difficulty;
  final String visibility;

  final int durationDays;

  final int rewardXP;
  final int rewardCoins;
  final String? rewardBadgeId;

  final int participantsCount;
  final int maxParticipants;

  final List<String> rules;
  final List<ChallengeTaskModel> tasks;

  final Timestamp createdAt;
  final Timestamp? startDate;
  final Timestamp? endDate;

  final bool isArchived;

  const ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.creatorId,
    required this.category,
    required this.difficulty,
    required this.visibility,
    required this.durationDays,
    required this.rewardXP,
    required this.rewardCoins,
    this.rewardBadgeId,
    required this.participantsCount,
    required this.maxParticipants,
    required this.rules,
    required this.tasks,
    required this.createdAt,
    this.startDate,
    this.endDate,
    required this.isArchived,
  });

  ChallengeModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? creatorId,
    String? category,
    String? difficulty,
    String? visibility,
    int? durationDays,
    int? rewardXP,
    int? rewardCoins,
    String? rewardBadgeId,
    int? participantsCount,
    int? maxParticipants,
    List<String>? rules,
    List<ChallengeTaskModel>? tasks,
    Timestamp? createdAt,
    Timestamp? startDate,
    Timestamp? endDate,
    bool? isArchived,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      creatorId: creatorId ?? this.creatorId,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      visibility: visibility ?? this.visibility,
      durationDays: durationDays ?? this.durationDays,
      rewardXP: rewardXP ?? this.rewardXP,
      rewardCoins: rewardCoins ?? this.rewardCoins,
      rewardBadgeId: rewardBadgeId ?? this.rewardBadgeId,
      participantsCount: participantsCount ?? this.participantsCount,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      rules: rules ?? this.rules,
      tasks: tasks ?? this.tasks,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  factory ChallengeModel.fromMap(Map<String, dynamic> map) {
    return ChallengeModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      creatorId: map['creatorId'] ?? '',
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? 'Easy',
      visibility: map['visibility'] ?? 'Public',
      durationDays: map['durationDays'] ?? 0,
      rewardXP: map['rewardXP'] ?? 0,
      rewardCoins: map['rewardCoins'] ?? 0,
      rewardBadgeId: map['rewardBadgeId'],
      participantsCount: map['participantsCount'] ?? 0,
      maxParticipants: map['maxParticipants'] ?? 0,
      rules: List<String>.from(map['rules'] ?? []),
      tasks: (map['tasks'] as List<dynamic>? ?? [])
          .map((task) => ChallengeTaskModel.fromMap(task))
          .toList(),
      createdAt: map['createdAt'] ?? Timestamp.now(),
      startDate: map['startDate'],
      endDate: map['endDate'],
      isArchived: map['isArchived'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'creatorId': creatorId,
      'category': category,
      'difficulty': difficulty,
      'visibility': visibility,
      'durationDays': durationDays,
      'rewardXP': rewardXP,
      'rewardCoins': rewardCoins,
      'rewardBadgeId': rewardBadgeId,
      'participantsCount': participantsCount,
      'maxParticipants': maxParticipants,
      'rules': rules,
      'tasks': tasks.map((e) => e.toMap()).toList(),
      'createdAt': createdAt,
      'startDate': startDate,
      'endDate': endDate,
      'isArchived': isArchived,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    creatorId,
    category,
    difficulty,
    visibility,
    durationDays,
    rewardXP,
    rewardCoins,
    rewardBadgeId,
    participantsCount,
    maxParticipants,
    rules,
    tasks,
    createdAt,
    startDate,
    endDate,
    isArchived,
  ];
}
