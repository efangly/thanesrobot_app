import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/services/api.dart';
import 'package:thanesrobot/services/playsound.dart';

class DeliveryService {
  void devileryServ(BuildContext context, String param) async {
    Api api = Api();
    PlaySound sound = PlaySound();
    const oneSec = Duration(seconds: 1);
    if (param == "charge") {
      context.read<NavigateBloc>().add(NavigateStatus("3"));
      await api.navigationToCharge();
      await sound.play("charge.mp3");
    } else {
      context.read<NavigateBloc>().add(NavigateStatus("2"));
      await api.postNavigation(param);
      await sound.play("sending.mp3");
    }
    Timer.periodic(
      oneSec,
      (Timer timer) async {
        String movebasestatus = await api.movebaseStatus();
        if (movebasestatus == "1") {
          print("Robot is Movebase..");
        } else {
          sound.play(param == "charge" ? "charging.mp3" : "shelf1.mp3");
          // ignore: use_build_context_synchronously
          context.read<NavigateBloc>().add(NavigateStatus("1"));
          timer.cancel();
        }
      },
    );
  }
}
