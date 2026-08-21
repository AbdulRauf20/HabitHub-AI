import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommunityActivityModel extends Equatable {
  final String id;

  final String userId;
  final String userName;
  final String username;
  final String profileImageUrl;

  final String type;
  final String title;
  final String description;

  final String? challengeId;
  final String? challengeTitle;

  final String? badgeId;
  final String? badgeName;

  final int likesCount;
  final bool isLiked;

  final Timestamp createdAt;

  const CommunityActivityModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.username,
    required this.profileImageUrl,
    required this.type,
    required this.title,
    required this.description,
    this.challengeId,
    this.challengeTitle,
    this.badgeId,
    this.badgeName,
    required this.likesCount,
    required this.isLiked,
    required this.createdAt,
  });

  factory CommunityActivityModel.fromMap(String id, Map<String, dynamic> map) {
    return CommunityActivityModel(
      id: id,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      username: map['username'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      challengeId: map['challengeId'],
      challengeTitle: map['challengeTitle'],
      badgeId: map['badgeId'],
      badgeName: map['badgeName'],
      likesCount: (map['likesCount'] ?? 0) as int,
      isLiked: map['isLiked'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'username': username,
      'profileImageUrl': profileImageUrl,
      'type': type,
      'title': title,
      'description': description,
      'challengeId': challengeId,
      'challengeTitle': challengeTitle,
      'badgeId': badgeId,
      'badgeName': badgeName,
      'likesCount': likesCount,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    userName,
    username,
    profileImageUrl,
    type,
    title,
    description,
    challengeId,
    challengeTitle,
    badgeId,
    badgeName,
    likesCount,
    isLiked,
    createdAt,
  ];
}
