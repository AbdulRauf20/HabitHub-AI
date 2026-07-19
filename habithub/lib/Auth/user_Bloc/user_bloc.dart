import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {

    on<LoadUserRequested>(_loadUser);

    on<RefreshUserRequested>(_refreshUser);

    on<UpdateUserRequested>(_updateUser);
  }

  Future<void> _loadUser(
      LoadUserRequested event,
      Emitter<UserState> emit,
  ) async {}

  Future<void> _refreshUser(
      RefreshUserRequested event,
      Emitter<UserState> emit,
  ) async {}

  Future<void> _updateUser(
      UpdateUserRequested event,
      Emitter<UserState> emit,
  ) async {}
}