abstract class AuthEvent {}

/// Check if user is already logged in
class CheckAuthStatusRequested extends AuthEvent {}

/// Login
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

/// Signup
class SignupRequested extends AuthEvent {
  final String fullName;
  final String userName;
  final String email;
  final String password;

  SignupRequested({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
  });
}

/// Forgot Password
class ForgotPasswordRequested extends AuthEvent {
  final String email;

  ForgotPasswordRequested({required this.email});
}

/// Check whether email has been verified
class CheckEmailVerificationRequested extends AuthEvent {}

/// Complete user profile
class CompleteProfileRequested extends AuthEvent {
  final String bio;
  final String gender;

  CompleteProfileRequested({required this.bio, required this.gender});
}

/// Logout
class LogoutRequested extends AuthEvent {}
