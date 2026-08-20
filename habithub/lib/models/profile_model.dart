import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String profileImageUrl;

  final int totalXP;
  final int level;

  final int completedTasks;
  final int completedChallenges;

  final int currentStreak;
  final int longestStreak;

  final int leaderboardRank;

  final List<String> ownedBadgeIds;
  final String? activeBadgeId;

  final Timestamp createdAt;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.profileImageUrl,
    required this.totalXP,
    required this.level,
    required this.completedTasks,
    required this.completedChallenges,
    required this.currentStreak,
    required this.longestStreak,
    required this.leaderboardRank,
    required this.ownedBadgeIds,
    this.activeBadgeId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    bio,
    profileImageUrl,
    totalXP,
    level,
    completedTasks,
    completedChallenges,
    currentStreak,
    longestStreak,
    leaderboardRank,
    ownedBadgeIds,
    activeBadgeId,
    createdAt,
  ];
}
