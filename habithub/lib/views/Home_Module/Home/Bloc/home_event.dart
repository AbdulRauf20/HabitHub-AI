import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load everything needed for Home Screen
class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

/// Pull to refresh
class RefreshHome extends HomeEvent {
  const RefreshHome();
}

/// Mark a habit completed
class CompleteHabit extends HomeEvent {
  final String habitId;

  const CompleteHabit({
    required this.habitId,
  });

  @override
  List<Object?> get props => [habitId];
}