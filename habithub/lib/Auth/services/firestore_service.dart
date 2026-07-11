import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habithub/Auth/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Collection Reference
  CollectionReference get users => _firestore.collection('users');

  // -------------------------
  // Create User
  // -------------------------
  Future<void> createUser(UserModel user) async {
    try {
      await users.doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to create user.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // -------------------------
  // Get User
  // -------------------------
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await users.doc(uid).get();

      if (!doc.exists) return null;

      return UserModel.fromMap(
        doc.data() as Map<String, dynamic>,
      );
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to get user.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // -------------------------
  // Update User
  // -------------------------
  Future<void> updateUser(
    String uid,
    Map<String, dynamic> data,
  ) async {
    try {
      await users.doc(uid).update(data);
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to update user.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // -------------------------
  // Delete User
  // -------------------------
  Future<void> deleteUser(String uid) async {
    try {
      await users.doc(uid).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to delete user.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // -------------------------
  // Check Profile Completion
  // -------------------------
  Future<bool> isProfileCompleted(String uid) async {
    try {
      final user = await getUser(uid);

      if (user == null) return false;

      return user.profileCompleted;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}