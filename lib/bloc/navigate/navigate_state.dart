part of 'navigate_bloc.dart';

class NavigateState extends Equatable {
  final String rfid;
  final String movestatus;

  const NavigateState({this.rfid = "", this.movestatus = "1"});

  NavigateState copyWith({String? rfid, String? movestatus}) {
    return NavigateState(
        rfid: rfid ?? this.rfid, movestatus: movestatus ?? this.movestatus);
  }

  @override
  List<Object> get props => [rfid, movestatus];
}
