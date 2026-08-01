import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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

  /// Returns the challenges currently joined by the logged-in user.
  Future<List<ChallengePreviewModel>> getJoinedChallenges() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in.');
    }

    final joinedSnapshot = await _firestoreService.getSubCollection(
      collection: 'users',
      documentId: user.uid,
      subCollection: 'joinedChallenges',
    );

    final challenges = <ChallengePreviewModel>[];

    for (final joinedDocument in joinedSnapshot.docs) {
      try {
        final joinedData = joinedDocument.data();

        final challengeId = joinedData['challengeId'] ?? joinedDocument.id;

        final challengeDocument = await _firestoreService.getDocument(
          collection: 'challenges',
          documentId: challengeId,
        );

        if (!challengeDocument.exists) {
          debugPrint('Challenge not found: $challengeId');
          continue;
        }

        final challengeData = challengeDocument.data()!;

        final todayTasks = await _getTodayTasks(
          userId: user.uid,
          challengeId: challengeId,
          challengeData: challengeData,
        );

        final preview = ChallengePreviewModel(
          challengeId: challengeId,
          title: challengeData['title'] ?? 'Challenge',
          description: challengeData['description'] ?? '',
          currentDay: joinedData['currentDay'] ?? 0,
          totalDays: challengeData['durationDays'] ?? 0,
          progress: (joinedData['progress'] ?? 0).toDouble(),
          streak: joinedData['currentStreak'] ?? 0,
          xpReward: challengeData['rewardXP'] ?? 0,
          isStarted: joinedData['status'] == 'active',
          daysRemaining: _calculateDaysRemaining(
            joinedData['startDate'],
            challengeData['durationDays'],
          ),
          todayTasks: todayTasks,
        );

        challenges.add(preview);
      } catch (e) {
        debugPrint(
          'Failed to load challenge '
          '${joinedDocument.id}: $e',
        );
      }
    }

    return challenges;
  }

  Future<List<TodayTaskPreviewModel>> _getTodayTasks({
    required String userId,
    required String challengeId,
    required Map<String, dynamic> challengeData,
  }) async {
    final rawTasks = challengeData['tasks'];

    if (rawTasks is! List) {
      return [];
    }

    final today = _todayKey();

    final progressDocument = await _firestoreService.firestore
        .collection('users')
        .doc(userId)
        .collection('joinedChallenges')
        .doc(challengeId)
        .collection('taskProgress')
        .doc(today)
        .get();

    final progressData = progressDocument.data();

    final completedTasks = progressData?['completedTasks'];

    final completedMap = <String, bool>{};

    if (completedTasks is Map) {
      completedTasks.forEach((key, value) {
        completedMap[key.toString()] = value == true;
      });
    }

    return rawTasks.whereType<Map>().map((task) {
      final taskMap = Map<String, dynamic>.from(task);

      final taskId = taskMap['taskId'] ?? taskMap['id'] ?? '';

      return TodayTaskPreviewModel(
        taskId: taskId,
        title: taskMap['title'] ?? '',
        isCompleted: completedMap[taskId] ?? false, id: '',
      );
    }).toList();
  }

  int _calculateDaysRemaining(dynamic rawStartDate, int durationDays) {
    if (rawStartDate == null || durationDays <= 0) {
      return 0;
    }

    DateTime startDate;

    if (rawStartDate is DateTime) {
      startDate = rawStartDate;
    } else {
      startDate = rawStartDate.toDate();
    }

    final today = DateTime.now();

    final start = DateTime(startDate.year, startDate.month, startDate.day);

    final current = DateTime(today.year, today.month, today.day);

    final elapsed = current.difference(start).inDays;

    final remaining = durationDays - elapsed;

    return remaining < 0 ? 0 : remaining;
  }

  String _todayKey() {
    final now = DateTime.now();

    final month = now.month.toString().padLeft(2, '0');

    final day = now.day.toString().padLeft(2, '0');

    return '${now.year}-$month-$day';
  }
}
