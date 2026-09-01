import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //login with apple
  Future<UserCredential> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      return await _auth.signInWithCredential(oauthCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Apple sign in failed.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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
      throw Exception('Something went wrong. Please try again.');
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
  Future<void> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.reload(); // Refresh user data
        return FirebaseAuth.instance.currentUser;
      }

      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Failed to get current user.");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("No user is currently logged in.");
      }

      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Failed to send verification email.");
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw Exception("Google sign in cancelled");
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status != LoginStatus.success) {
      throw Exception("Facebook sign in cancelled.");
    }

    final OAuthCredential credential = FacebookAuthProvider.credential(
      loginResult.accessToken!.tokenString,
    );

    return await _auth.signInWithCredential(credential);
  }
}
