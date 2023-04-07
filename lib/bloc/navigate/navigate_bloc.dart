import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'navigate_event.dart';
part 'navigate_state.dart';

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc() : super(const NavigateState()) {
    on<NavigateReset>((event, emit) {
      emit(state.copyWith(rfid: ""));
    });

    on<NavigateAssign>((event, emit) {
      emit(state.copyWith(rfid: event.payload));
    });

    on<NavigateStatus>((event, emit) {
      emit(state.copyWith(movestatus: event.payloadstatus));
    });
  }
}
