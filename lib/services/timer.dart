import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/services/delivery.dart';
import 'package:thanesrobot/services/playsound.dart';

class TimerService {
  void startTimer(BuildContext context, int counter, String param) async {
    int count = counter;
    const oneSec = Duration(seconds: 1);
    if (param != "charge") {
      await PlaySound().play("receipt.mp3");
    }
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (count == 0) {
          DeliveryService().devileryServ(context, param);
          context.read<NavigateBloc>().add(NavigateReset());
          timer.cancel();
        } else {
          context.read<TimerBloc>().add(TimerEventCountDown());
          count--;
        }
      },
    );
  }
}
