import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object?> get props => [];
}

class LoadCommunity extends CommunityEvent {
  const LoadCommunity();
}

class RefreshCommunity extends CommunityEvent {
  const RefreshCommunity();
}

class ToggleChallengeLike extends CommunityEvent {
  final String challengeId;

  const ToggleChallengeLike({required this.challengeId});

  @override
  List<Object?> get props => [challengeId];
}

class JoinCommunityChallenge extends CommunityEvent {
  final String challengeId;

  const JoinCommunityChallenge({required this.challengeId});

  @override
  List<Object?> get props => [challengeId];
}

class ToggleCommunityFollow extends CommunityEvent {
  final String creatorId;

  const ToggleCommunityFollow({required this.creatorId});

  @override
  List<Object?> get props => [creatorId];
}
