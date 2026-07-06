import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
// login 
Future<UserCredential> login({
  required String email,
  required String password,
}) async {
  try {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'user-not-found':
        throw Exception('No user found with this email.');

      case 'wrong-password':
        throw Exception('Incorrect password.');

      case 'invalid-email':
        throw Exception('Invalid email address.');

      default:
        throw Exception('Login failed. Please try again.');
    }
  } catch (e) {
    throw Exception(
      'Something went wrong. Please try again.',
    );
  }
}

// signup 
Future<UserCredential> signup({
  required String email,
  required String password,
}) async {
  try {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'email-already-in-use':
        throw Exception('An account with this email already exists.');

      case 'weak-password':
        throw Exception('Password is too weak.');

      case 'invalid-email':
        throw Exception('Invalid email address.');

      default:
        throw Exception('Signup failed. Please try again.');
    }
  } catch (e) {
    throw Exception('Something went wrong. Please try again.');
  }
}

// forgot password
Future<void> forgotPassword({
  required String email,
}) async {
  try {
    await _auth.sendPasswordResetEmail(
      email: email,
    );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-email':
        throw Exception('Invalid email address.');

      case 'user-not-found':
        throw Exception('No user found with this email.');

      default:
        throw Exception('Failed to send reset email.');
    }
  } catch (e) {
    throw Exception('Something went wrong.');
  }
}

// logout 

Future<void> logout() async {
  try {
    await _auth.signOut();
  } catch (e) {
    throw Exception('Logout failed.');
  }
}

//verify email

Future<bool> isEmailVerified() async {
  await _auth.currentUser?.reload();

  return _auth.currentUser?.emailVerified ?? false;
}

// check auth status

Future<User?> getCurrentUser() async {
  return _auth.currentUser;
}


}
