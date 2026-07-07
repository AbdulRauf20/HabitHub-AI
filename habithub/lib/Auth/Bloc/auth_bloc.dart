import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc({required AuthService authService})
    : _authService = authService,
      super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<CheckAuthStatusRequested>(_onCheckAuthStatusRequested);
    on<CheckEmailVerificationRequested>(_onCheckEmailVerificationRequested);
    on<CompleteProfileRequested>(_onCompleteProfileRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ResendVerificationEmailRequested>(_onResendVerificationEmailRequested);
  }
  Future<void> _onResendVerificationEmailRequested(
    ResendVerificationEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authService.resendVerificationEmail();

      emit(EmailNotVerified());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Login
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userCredential = await _authService.login(
        email: event.email,
        password: event.password,
      );

      final user = userCredential.user;

      if (user == null) {
        emit(AuthFailure(message: 'User not found.'));
        return;
      }

      if (!user.emailVerified) {
        emit(EmailNotVerified());
        return;
      }

      emit(
        Authenticated(
          emailVerified: true,
          profileCompleted: false, // Firestore later
        ),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Signup
  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userCredential = await _authService.signup(
        email: event.email,
        password: event.password,
      );

      final user = userCredential.user;

      if (user == null) {
        emit(AuthFailure(message: 'Failed to create account.'));
        return;
      }

      await user.sendEmailVerification();

      emit(EmailNotVerified());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Forgot Password
  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authService.forgotPassword(email: event.email);

      emit(Unauthenticated());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Check if user is already logged in
 Future<void> _onCheckAuthStatusRequested(
  CheckAuthStatusRequested event,
  Emitter<AuthState> emit,
) async {
  emit(AuthLoading());

  try {
    final user = await _authService.getCurrentUser();

    if (user == null) {
      emit(Unauthenticated());
      return;
    }

    // Always reload to get the latest verification status
    await user.reload();

    final refreshedUser = await _authService.getCurrentUser();

    if (refreshedUser == null) {
      emit(Unauthenticated());
      return;
    }

    if (!refreshedUser.emailVerified) {
      emit(EmailNotVerified());
      return;
    }

    // Firestore check will be added tomorrow.
    emit(ProfileIncomplete());
  } catch (e) {
    emit(
      AuthFailure(
        message: e.toString(),
      ),
    );
  }
}

  /// Check Email Verification
  Future<void> _onCheckEmailVerificationRequested(
    CheckEmailVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final isVerified = await _authService.isEmailVerified();

      if (isVerified) {
        emit(ProfileIncomplete());
      } else {
        emit(EmailNotVerified());
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  /// Complete Profile
  Future<void> _onCompleteProfileRequested(
    CompleteProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    // We will implement this after integrating Cloud Firestore.
  }

  /// Logout
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authService.logout();

      emit(Unauthenticated());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
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