import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habithub/models/%20home_model.dart';

class HomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<HomeModel> getHomeData() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final doc = await _firestore
        .collection('users')
        .doc(user.uid)
        .get();

    if (!doc.exists) {
      throw Exception("User data not found.");
    }

    return HomeModel.fromMap(doc.data()!);
  }
}