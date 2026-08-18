import 'package:equatable/equatable.dart';

abstract class CreateChallengeState extends Equatable {
  const CreateChallengeState();

  @override
  List<Object?> get props => [];
}

class CreateChallengeInitial extends CreateChallengeState {
  const CreateChallengeInitial();
}

class CreateChallengeLoading extends CreateChallengeState {
  const CreateChallengeLoading();
}

class CreateChallengeSuccess extends CreateChallengeState {
  final String challengeId;

  const CreateChallengeSuccess({required this.challengeId});

  @override
  List<Object?> get props => [challengeId];
}

class CreateChallengeError extends CreateChallengeState {
  final String message;

  const CreateChallengeError({required this.message});

  @override
  List<Object?> get props => [message];
}
