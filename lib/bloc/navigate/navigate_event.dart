part of 'navigate_bloc.dart';

abstract class NavigateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateReset extends NavigateEvent {}

class NavigateAssign extends NavigateEvent {
  final String payload;
  NavigateAssign(this.payload);
}

class NavigateStatus extends NavigateEvent {
  final String payloadstatus;
  NavigateStatus(this.payloadstatus);
}
