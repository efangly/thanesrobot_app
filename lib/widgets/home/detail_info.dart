import 'package:flutter/material.dart';
import 'package:thanesrobot/widgets/home/info_box.dart';
import 'package:thanesrobot/widgets/home/queue_box.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueGrey,
            Colors.blue,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.71,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoBox(),
          QueueBox(),
        ],
      ),
    );
  }
}
