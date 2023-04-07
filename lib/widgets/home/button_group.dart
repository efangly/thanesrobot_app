import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/pages/setting_page.dart';

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => {
            context.read<NavigateBloc>().add(NavigateAssign("charge")),
            context.read<TimerBloc>().add(TimerEventInit()),
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.home, size: 40),
              Text('กลับจุดชาร์จ', style: TextStyle(fontSize: 15.0)),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            ),
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12,
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.settings, size: 45),
              //Text('ตั้งค่า', style: TextStyle(fontSize: 15.0)),
            ],
          ),
        ),
      ],
    );
  }
}
