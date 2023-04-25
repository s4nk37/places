import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {
  const BatteryLevel({Key? key}) : super(key: key);

  @override
  State<BatteryLevel> createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  static const platform = MethodChannel('com.example.places/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result %';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.battery_std),
        Text(_batteryLevel),
      ],
    );
  }
}
