import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial
class HomeInitial extends HomeState {}

/// Loading
class HomeLoading extends HomeState {}

/// Loaded
class HomeLoaded extends HomeState {
  final String userName;
  final int streak;
  final int xp;
  final String badge;

  const HomeLoaded({
    required this.userName,
    required this.streak,
    required this.xp,
    required this.badge,
  });

  @override
  List<Object?> get props => [
        userName,
        streak,
        xp,
        badge,
      ];
}

/// Error
class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}