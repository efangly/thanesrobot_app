import 'package:flutter/material.dart';
import 'package:thanesrobot/widgets/home/queue_list.dart';

class QueueBox extends StatelessWidget {
  const QueueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(200, 200, 200, 1),
        backgroundBlendMode: BlendMode.modulate,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: MediaQuery.of(context).size.width * 0.57,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Column(
          children: [
            const Text(
              "รายการคิวรอส่ง",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: const QueueList(),
            ),
          ],
        ),
      ),
    );
  }
}
