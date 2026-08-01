import 'package:firebase_auth/firebase_auth.dart';
import 'package:habithub/models/challenge_preview_model.dart';
import 'package:habithub/models/today_task_preview_model.dart';
import 'package:habithub/services/firestore_service.dart';

class ChallengeRepository {
  final FirestoreService _firestoreService;
  final FirebaseAuth _auth;

  ChallengeRepository({
    required FirestoreService firestoreService,
    FirebaseAuth? auth,
  }) : _firestoreService = firestoreService,
       _auth = auth ?? FirebaseAuth.instance;

  /// Fetch the challenges currently joined by the logged-in user.
  ///
  /// This method currently reads the user's joinedChallenges
  /// subcollection. We will later enrich this data with:
  /// - challenge information
  /// - today's tasks
  /// - task progress
  /// - streak information
  /// - rewards
  Future<List<ChallengePreviewModel>> getJoinedChallenges() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw Exception('User is not logged in.');
    }

    final snapshot = await _firestoreService.getSubCollection(
      collection: FirestoreCollections.users,
      documentId: currentUser.uid,
      subCollection: 'joinedChallenges',
    );

    return snapshot.docs.map((document) {
      final data = document.data();

      return ChallengePreviewModel(
        challengeId: data['challengeId'] ?? document.id,
        title: data['title'] ?? 'Challenge',
        description: data['description'] ?? '',
        currentDay: data['currentDay'] ?? 0,
        totalDays: data['totalDays'] ?? 0,
        progress: (data['progress'] ?? 0).toDouble(),
        streak: data['currentStreak'] ?? 0,
        xpReward: data['xpReward'] ?? 0,
        isStarted: data['isStarted'] ?? true,
        daysRemaining: data['daysRemaining'] ?? 0,
        todayTasks: _parseTodayTasks(data['todayTasks']),
      );
    }).toList();
  }

  List<TodayTaskPreviewModel> _parseTodayTasks(dynamic rawTasks) {
    if (rawTasks is! List) {
      return [];
    }

    return rawTasks
        .whereType<Map>()
        .map(
          (task) =>
              TodayTaskPreviewModel.fromMap(Map<String, dynamic>.from(task)),
        )
        .toList();
  }
}
