import 'package:flutter/material.dart';
import 'package:thanesrobot/widgets/setting/setting_box.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey,
                  Colors.blue,
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          const Positioned(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: SettingBox(),
            ),
          )
        ],
      ),
    );
  }
}
