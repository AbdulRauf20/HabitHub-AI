import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommunityChallengeModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  final String creatorId;
  final String creatorName;
  final String creatorUsername;
  final String creatorProfileImageUrl;

  final int durationDays;
  final int rewardXP;
  final int participantsCount;
  final int likesCount;

  final bool isLiked;
  final bool isJoined;
  final bool isFollowingCreator;

  final Timestamp createdAt;

  const CommunityChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.creatorId,
    required this.creatorName,
    required this.creatorUsername,
    required this.creatorProfileImageUrl,
    required this.durationDays,
    required this.rewardXP,
    required this.participantsCount,
    required this.likesCount,
    required this.isLiked,
    required this.isJoined,
    required this.isFollowingCreator,
    required this.createdAt,
  });

  factory CommunityChallengeModel.fromMap(String id, Map<String, dynamic> map) {
    return CommunityChallengeModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      creatorId: map['creatorId'] ?? '',
      creatorName: map['creatorName'] ?? '',
      creatorUsername: map['creatorUsername'] ?? '',
      creatorProfileImageUrl: map['creatorProfileImageUrl'] ?? '',
      durationDays: (map['durationDays'] ?? 0) as int,
      rewardXP: (map['rewardXP'] ?? 0) as int,
      participantsCount: (map['participantsCount'] ?? 0) as int,
      likesCount: (map['likesCount'] ?? 0) as int,
      isLiked: map['isLiked'] ?? false,
      isJoined: map['isJoined'] ?? false,
      isFollowingCreator: map['isFollowingCreator'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'creatorUsername': creatorUsername,
      'creatorProfileImageUrl': creatorProfileImageUrl,
      'durationDays': durationDays,
      'rewardXP': rewardXP,
      'participantsCount': participantsCount,
      'likesCount': likesCount,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    creatorId,
    creatorName,
    creatorUsername,
    creatorProfileImageUrl,
    durationDays,
    rewardXP,
    participantsCount,
    likesCount,
    isLiked,
    isJoined,
    isFollowingCreator,
    createdAt,
  ];
}
