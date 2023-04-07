import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanesrobot/bloc/navigate/navigate_bloc.dart';
import 'package:thanesrobot/bloc/timer/timer_bloc.dart';
import 'package:thanesrobot/widgets/home/button_group.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

class SerialInfo extends StatefulWidget {
  const SerialInfo({super.key});

  @override
  State<SerialInfo> createState() => _SerialInfoState();
}

class _SerialInfoState extends State<SerialInfo> {
  UsbPort? _port;
  String _portname = "ไม่พบพอร์ตที่เชื่อมต่อ";
  String _status = "Idle";
  List<Widget> _ports = [];
  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  Future<bool> _connectTo(device) async {
    if (_subscription != null) {
      _subscription!.cancel();
      _subscription = null;
    }

    if (_transaction != null) {
      _transaction!.dispose();
      _transaction = null;
    }

    if (_port != null) {
      _port!.close();
      _port = null;
    }

    if (device == null) {
      _device = null;
      setState(() {
        _status = "ไม่ได้เชื่อมต่อ";
      });
      return true;
    }

    _port = await device.create();
    if (await (_port!.open()) != true) {
      setState(() {
        _status = "Failed to open port";
      });
      return false;
    }
    _device = device;

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
      9600,
      UsbPort.DATABITS_8,
      UsbPort.STOPBITS_1,
      UsbPort.PARITY_NONE,
    );

    _transaction = Transaction.stringTerminated(
      _port!.inputStream as Stream<Uint8List>,
      Uint8List.fromList([13, 10]),
    );

    _subscription = _transaction!.stream.listen((String line) {
      setState(() {
        context.read<NavigateBloc>().add(NavigateAssign(line));
        context.read<TimerBloc>().add(TimerEventInit());
      });
    });

    setState(() {
      _status = "เชื่อมต่อแล้ว";
    });
    return true;
  }

  void _getPorts() async {
    _ports = [];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (!devices.contains(_device)) {
      _connectTo(null);
    }

    for (var device in devices) {
      _ports.add(
        ElevatedButton.icon(
          onPressed: () {
            _connectTo(_device == device ? null : device).then((res) {
              _portname = device.productName!;
              _getPorts();
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          label: Text(
            _device == device ? "หยุดเชื่อมต่อ" : "เชื่อมต่อ....!!!",
            style: const TextStyle(fontSize: 17.0),
          ),
          icon: const Icon(Icons.sync_alt_outlined, size: 24.0),
        ),
      );
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  @override
  void dispose() {
    super.dispose();
    _connectTo(null);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _ports.isNotEmpty ? _portname : "ไม่พบพอร์ตที่เชื่อมต่อ",
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text('สถานะ: $_status', style: const TextStyle(fontSize: 15.0)),
            ..._ports,
          ],
        ),
        const SizedBox(width: 10.0),
        const ButtonGroup(),
      ],
    );
  }
}
