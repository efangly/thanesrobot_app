part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerEventInit extends TimerEvent {}

class TimerEventCountDown extends TimerEvent {}
