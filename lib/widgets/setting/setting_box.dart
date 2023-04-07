import 'package:flutter/material.dart';
import 'package:thanesrobot/widgets/setting/setting_detail.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(200, 200, 200, 1),
        backgroundBlendMode: BlendMode.modulate,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.settings, size: 30)),
                      TextSpan(
                        text: 'ตั้งค่าการใช้งานและการเชื่อมต่อ',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.save_alt, size: 25),
                          Text('บันทึกข้อมูล',
                              style: TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.arrow_back, size: 25),
                          Text('กลับหน้าหลัก',
                              style: TextStyle(fontSize: 15.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 15.0,
              color: Colors.white54,
            ),
            const SettingDetail(),
          ],
        ),
      ),
    );
  }
}
