import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habithub/views/repositories/community_repository.dart';

import 'community_event.dart';
import 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository _repository;

  CommunityBloc({required CommunityRepository repository})
    : _repository = repository,
      super(const CommunityInitial()) {
    on<LoadCommunity>(_onLoadCommunity);
    on<RefreshCommunity>(_onRefreshCommunity);
    on<ToggleChallengeLike>(_onToggleChallengeLike);
    on<JoinCommunityChallenge>(_onJoinCommunityChallenge);
    on<ToggleCommunityFollow>(_onToggleCommunityFollow);
  }

  Future<void> _onLoadCommunity(
    LoadCommunity event,
    Emitter<CommunityState> emit,
  ) async {
    emit(const CommunityLoading());

    try {
      final challenges = await _repository.getCommunityChallenges();

      emit(CommunityLoaded(challenges: challenges));
    } catch (e) {
      emit(CommunityError(message: e.toString()));
    }
  }

  Future<void> _onRefreshCommunity(
    RefreshCommunity event,
    Emitter<CommunityState> emit,
  ) async {
    add(const LoadCommunity());
  }

  Future<void> _onToggleChallengeLike(
    ToggleChallengeLike event,
    Emitter<CommunityState> emit,
  ) async {
    final currentState = state;

    if (currentState is! CommunityLoaded) {
      return;
    }

    try {
      await _repository.toggleLike(challengeId: event.challengeId);

      final challenges = await _repository.getCommunityChallenges();

      emit(CommunityLoaded(challenges: challenges));
    } catch (e) {
      emit(CommunityError(message: e.toString()));
    }
  }

  Future<void> _onJoinCommunityChallenge(
    JoinCommunityChallenge event,
    Emitter<CommunityState> emit,
  ) async {
    final currentState = state;

    if (currentState is! CommunityLoaded) {
      return;
    }

    try {
      await _repository.joinChallenge(challengeId: event.challengeId);

      final challenges = await _repository.getCommunityChallenges();

      emit(CommunityLoaded(challenges: challenges));
    } catch (e) {
      emit(CommunityError(message: e.toString()));
    }
  }

  Future<void> _onToggleCommunityFollow(
    ToggleCommunityFollow event,
    Emitter<CommunityState> emit,
  ) async {
    final currentState = state;

    if (currentState is! CommunityLoaded) {
      return;
    }

    try {
      await _repository.toggleFollow(creatorId: event.creatorId);

      final challenges = await _repository.getCommunityChallenges();

      emit(CommunityLoaded(challenges: challenges));
    } catch (e) {
      emit(CommunityError(message: e.toString()));
    }
  }
}
