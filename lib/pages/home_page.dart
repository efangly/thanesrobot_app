import 'package:flutter/material.dart';
import 'package:thanesrobot/widgets/home/detail_info.dart';
import 'package:thanesrobot/widgets/home/logo.dart';
import 'package:thanesrobot/widgets/home/serial_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.blue,
                      Colors.grey,
                    ],
                  ),
                  backgroundBlendMode: BlendMode.overlay,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Logo(),
                    SerialInfo(),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              const DetailInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
