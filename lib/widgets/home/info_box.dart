import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/widgets/home/timer_box.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(200, 200, 200, 1),
        backgroundBlendMode: BlendMode.modulate,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            const Text(
              "สถานะการทำงาน",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(
              height: 10.0,
              color: Colors.white54,
            ),
            BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                return Column(
                  children: const [
                    TimerBox(),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
