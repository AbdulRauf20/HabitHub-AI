import 'package:equatable/equatable.dart';

abstract class ChallengeEvent extends Equatable {
  const ChallengeEvent();

  @override
  List<Object?> get props => [];
}

class LoadJoinedChallenges extends ChallengeEvent {
  const LoadJoinedChallenges();
}

class RefreshChallenges extends ChallengeEvent {
  const RefreshChallenges();
}

class CompleteChallengeTask extends ChallengeEvent {
  final String challengeId;
  final String taskId;

  const CompleteChallengeTask({
    required this.challengeId,
    required this.taskId,
  });

  @override
  List<Object?> get props => [challengeId, taskId];
}
