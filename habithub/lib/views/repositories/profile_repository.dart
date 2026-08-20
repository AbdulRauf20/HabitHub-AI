import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:habithub/models/profile_model.dart';
import 'package:habithub/services/firestore_service.dart';

class ProfileRepository {
  final FirestoreService _firestoreService;
  final FirebaseAuth _auth;

  ProfileRepository({
    required FirestoreService firestoreService,
    FirebaseAuth? auth,
  }) : _firestoreService = firestoreService,
       _auth = auth ?? FirebaseAuth.instance;

  Future<ProfileModel> getProfile() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in.');
    }

    final document = await _firestoreService.getDocument(
      collection: 'users',
      documentId: user.uid,
    );

    final data = document.data() ?? {};

    return ProfileModel(
      id: user.uid,
      name: data['name'] ?? user.displayName ?? '',
      username: data['username'] ?? '',
      bio: data['bio'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? user.photoURL ?? '',
      totalXP: (data['totalXP'] ?? 0) as int,
      level: (data['level'] ?? 1) as int,
      completedTasks: (data['completedTasks'] ?? 0) as int,
      completedChallenges: (data['completedChallenges'] ?? 0) as int,
      currentStreak: (data['currentStreak'] ?? 0) as int,
      longestStreak: (data['longestStreak'] ?? 0) as int,
      leaderboardRank: (data['leaderboardRank'] ?? 0) as int,
      ownedBadgeIds: List<String>.from(data['ownedBadgeIds'] ?? []),
      activeBadgeId: data['activeBadgeId'],
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Future<void> updateProfile({
    required String name,
    required String username,
    required String bio,
    String? profileImageUrl,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in.');
    }

    final data = <String, dynamic>{
      'name': name,
      'username': username,
      'bio': bio,
    };

    if (profileImageUrl != null) {
      data['profileImageUrl'] = profileImageUrl;
    }

    await _firestoreService.updateDocument(
      collection: 'users',
      documentId: user.uid,
      data: data,
    );
  }

  Future<void> updateActiveBadge(String? badgeId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in.');
    }

    await _firestoreService.updateDocument(
      collection: 'users',
      documentId: user.uid,
      data: {'activeBadgeId': badgeId},
    );
  }
}
