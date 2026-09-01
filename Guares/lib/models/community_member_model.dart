import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommunityMemberModel extends Equatable {
  final String userId;

  final String role;

  final bool notificationsEnabled;

  final bool isMuted;

  final Timestamp joinedAt;

  const CommunityMemberModel({
    required this.userId,
    required this.role,
    required this.notificationsEnabled,
    required this.isMuted,
    required this.joinedAt,
  });

  CommunityMemberModel copyWith({
    String? userId,
    String? role,
    bool? notificationsEnabled,
    bool? isMuted,
    Timestamp? joinedAt,
  }) {
    return CommunityMemberModel(
      userId: userId ?? this.userId,
      role: role ?? this.role,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      isMuted: isMuted ?? this.isMuted,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  factory CommunityMemberModel.fromMap(Map<String, dynamic> map) {
    return CommunityMemberModel(
      userId: map['userId'] ?? '',
      role: map['role'] ?? 'Member',
      notificationsEnabled: map['notificationsEnabled'] ?? true,
      isMuted: map['isMuted'] ?? false,
      joinedAt: map['joinedAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'role': role,
      'notificationsEnabled': notificationsEnabled,
      'isMuted': isMuted,
      'joinedAt': joinedAt,
    };
  }

  @override
  List<Object?> get props => [
    userId,
    role,
    notificationsEnabled,
    isMuted,
    joinedAt,
  ];
}
