import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage(File image) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("No authenticated user found.");
      }

      final ref = _storage.ref().child("users/${user.uid}/profile.jpg");

      await ref.putFile(image);

      final imageUrl = await ref.getDownloadURL();

      return imageUrl;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? "Failed to upload profile image.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
