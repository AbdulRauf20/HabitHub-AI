import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_event.dart';
import 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc()
      : super(const BottomNavState(currentIndex: 0)) {
    on<BottomNavChanged>(_onBottomNavChanged);
  }

  void _onBottomNavChanged(
    BottomNavChanged event,
    Emitter<BottomNavState> emit,
  ) {
    emit(
      BottomNavState(
        currentIndex: event.index,
      ),
    );
  }
}