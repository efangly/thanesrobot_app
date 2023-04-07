import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(const TimerState()) {
    on<TimerEventInit>((event, emit) {
      emit(state.copyWith(count: 10));
    });

    on<TimerEventCountDown>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
