import 'package:equatable/equatable.dart';
import 'package:habithub/models/%20home_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class HomeInitial extends HomeState {}

/// Loading State
class HomeLoading extends HomeState {}

/// Loaded State
class HomeLoaded extends HomeState {
  final HomeModel home;

  const HomeLoaded({required this.home});

  @override
  List<Object?> get props => [home];
}

/// Error State
class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
