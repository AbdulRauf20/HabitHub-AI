import 'package:firebase_auth/firebase_auth.dart';
import 'package:habithub/models/%20home_model.dart';
import 'package:habithub/services/firestore_service.dart';

class HomeRepository {
  final FirestoreService _firestoreService;
  final FirebaseAuth _auth;

  HomeRepository({
    required FirestoreService firestoreService,
    FirebaseAuth? auth,
  }) : _firestoreService = firestoreService,
       _auth = auth ?? FirebaseAuth.instance;

  /// Fetches dashboard data for the currently logged-in user.
  Future<HomeModel> getHomeData() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw Exception('User is not logged in.');
    }

    final document = await _firestoreService.getDocument(
      collection: FirestoreCollections.users,
      documentId: currentUser.uid,
    );

    if (!document.exists || document.data() == null) {
      throw Exception('User document not found.');
    }

    return HomeModel.fromMap(document.data()!);
  }
}
