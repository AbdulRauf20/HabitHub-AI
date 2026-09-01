import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FollowModel extends Equatable {
  final String id;

  /// User who follows someone
  final String followerId;

  /// User being followed
  final String followingId;

  /// Whether this relationship is currently active
  final bool isFollowing;

  /// When the follow relationship was created
  final Timestamp createdAt;

  const FollowModel({
    required this.id,
    required this.followerId,
    required this.followingId,
    required this.isFollowing,
    required this.createdAt,
  });

  FollowModel copyWith({
    String? id,
    String? followerId,
    String? followingId,
    bool? isFollowing,
    Timestamp? createdAt,
  }) {
    return FollowModel(
      id: id ?? this.id,
      followerId: followerId ?? this.followerId,
      followingId: followingId ?? this.followingId,
      isFollowing: isFollowing ?? this.isFollowing,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory FollowModel.fromMap(Map<String, dynamic> map) {
    return FollowModel(
      id: map['id'] ?? '',
      followerId: map['followerId'] ?? '',
      followingId: map['followingId'] ?? '',
      isFollowing: map['isFollowing'] ?? true,
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'followerId': followerId,
      'followingId': followingId,
      'isFollowing': isFollowing,
      'createdAt': createdAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    followerId,
    followingId,
    isFollowing,
    createdAt,
  ];
}
