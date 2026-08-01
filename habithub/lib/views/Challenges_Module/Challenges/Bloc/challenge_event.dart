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
