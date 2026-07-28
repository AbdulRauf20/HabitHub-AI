import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habithub/models/%20home_model.dart';
import 'package:habithub/views/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<RefreshHome>(_onRefreshHome);
    on<CompleteHabit>(_onCompleteHabit);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final HomeModel homeData = await repository.getHomeData();

      emit(HomeLoaded(home: homeData));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onRefreshHome(
    RefreshHome event,
    Emitter<HomeState> emit,
  ) async {
    add(const LoadHomeData());
  }

  Future<void> _onCompleteHabit(
    CompleteHabit event,
    Emitter<HomeState> emit,
  ) async {
    // We'll implement this
    // when HabitRepository is created.
  }
}
