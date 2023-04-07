import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:thanesrobot/models/mqtt_model.dart';
import 'package:thanesrobot/services/mqttclient.dart';

class QueueList extends StatefulWidget {
  const QueueList({super.key});

  @override
  State<QueueList> createState() => _QueueListState();
}

class _QueueListState extends State<QueueList> {
  List<Data> data = [];
  MQTTClientManager mqttClientManager = MQTTClientManager();
  final String pubTopic = "data/queues";

  Future<void> setupMqttClient() async {
    await mqttClientManager.connect();
    mqttClientManager.subscribe(pubTopic);
  }

  void setupUpdatesListener() {
    mqttClientManager
        .getMessagesStream()!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      final MqttData result = MqttData.fromJson(json.decode(pt));
      setState(() {
        data = result.data!;
      });
    });
  }

  @override
  void initState() {
    setupMqttClient();
    setupUpdatesListener();
    super.initState();
  }

  @override
  void dispose() {
    mqttClientManager.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Text(
            "ไม่มีคิวจัดส่ง...",
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(1),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(
                  data[index].status == "1"
                      ? Icons.shopping_cart_checkout
                      : Icons.shopping_cart,
                  size: 40.0,
                ),
                title: Text("${data[index].patientname}"),
                subtitle: Text("เลขที่ใบยา : ${data[index].prescription}"),
                trailing: Text(
                  data[index].status == "1" ? "กำลังจัดส่ง" : "รอคิวจัดส่ง",
                ),
                selectedColor:
                    data[index].status == "1" ? Colors.yellow : Colors.white,
                selected: data[index].status == "1" ? true : false,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 4.0,
            ),
            itemCount: data.length,
          );
  }
}
