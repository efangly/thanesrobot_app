import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/services/timer.dart';
import 'package:thanesrobot/services/toast.dart';
import 'package:thanesrobot/widgets/home/delivering_logo.dart';

class TimerBox extends StatelessWidget {
  const TimerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return BlocBuilder<NavigateBloc, NavigateState>(
          builder: (context, naviState) {
            if (state.count == 10) {
              var result = naviState.rfid.split(",");
              ToastService().toastpopup(result[0]);
              TimerService().startTimer(context, state.count, result[0]);
            }
            return Column(
              children: [
                Text(
                  state.count == 0
                      ? (naviState.movestatus == "1"
                          ? "รอรับตะกร้ายา..."
                          : naviState.movestatus == "2"
                              ? "กำลังนำตะกร้ายาไปส่ง.."
                              : "กำลังกลับจุดชาร์จ..")
                      : (naviState.rfid == "charge"
                          ? "กำลังกลับจุดชาร์จในอีก..."
                          : "ตะกร้ายาจะถูกจัดส่งในอีก..."),
                  style: const TextStyle(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                state.count == 0
                    ? const DeliveringLogo()
                    : Text(
                        state.count == 0 ? "" : "${state.count} วินาที",
                        style: const TextStyle(fontSize: 40.0),
                      ),
              ],
            );
          },
        );
      },
    );
  }
}
