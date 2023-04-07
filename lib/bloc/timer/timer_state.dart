part of 'timer_bloc.dart';

class TimerState extends Equatable {
  final int count;

  const TimerState({this.count = 0});

  TimerState copyWith({int? count}) {
    return TimerState(count: count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}
