abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Unauthenticated extends AuthState {}

class EmailNotVerified extends AuthState {}

class ProfileIncomplete extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({
    required this.message,
  });
}

class Authenticated extends AuthState {
  final bool emailVerified;
  final bool profileCompleted;

  Authenticated({
    required this.emailVerified,
    required this.profileCompleted,
  });
}