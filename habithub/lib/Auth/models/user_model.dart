import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String username;
  final String email;
  final String? photoUrl;
  final String? gender;
  final DateTime? birthDate;
  final bool profileCompleted;
  final int streak;
  final int xp;
  final int level;
  final int coins;
  final int totalHabits;
  final Timestamp createdAt;
  final String goal;
  final String bio; 

  UserModel({
    required this.bio,
    required this.uid,
    required this.fullName,
    required this.username,
    required this.email,
    this.photoUrl,
    this.gender,
    this.birthDate,
    required this.profileCompleted,
    required this.streak,
    required this.xp,
    required this.level,
    required this.coins,
    required this.totalHabits,
    required this.createdAt,
    required this.goal, required String profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'gender': gender,
      'birthDate': birthDate,
      'profileCompleted': profileCompleted,
      'streak': streak,
      'xp': xp,
      'level': level,
      'coins': coins,
      'totalHabits': totalHabits,
      'createdAt': createdAt,
      'goal' : goal,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      bio: map['bio'],
      uid: map['uid'],
      fullName: map['fullName'],
      username: map['username'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      gender: map['gender'],
      birthDate: map['birthDate'] != null
          ? (map['birthDate'] as Timestamp).toDate()
          : null,
      profileCompleted: map['profileCompleted'] ?? false,
      streak: map['streak'] ?? 0,
      xp: map['xp'] ?? 0,
      level: map['level'] ?? 1,
      coins: map['coins'] ?? 0,
      totalHabits: map['totalHabits'] ?? 0,
      createdAt: map['createdAt'] ?? Timestamp.now(), goal: map['goal'], profileImage: map['profileImage']
    );
  }
}