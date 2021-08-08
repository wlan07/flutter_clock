import 'dart:math';

import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/views/widgets/myswitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:custom_switch/custom_switch.dart';

import 'AddAlarmTopBar.dart';
import 'AlarmIn.dart';
import 'AlarmSound.dart';
import 'AlarmTimeSelector.dart';
import 'AlarmVolume.dart';
import 'AlarmWithVibration.dart';
import 'RepeatIn.dart';
import 'alarmName.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key key}) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  @override
  Widget build(BuildContext context) {
    print("ADD ALARM BUILDED");

    return DefaultTextStyle(
      style: TextStyle(
          color: Color(0xff896d73), fontSize: 40, fontWeight: FontWeight.w900),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
          const AddAlarmTopBar(),
          Divider(
            color: Colors.black,
            endIndent: 10.0,
            indent: 10.0,
          ),
          const Expanded(flex: 1, child: const AlarmTimeSelector()),
          const AlarmIn(),
          Divider(
            color: Colors.black,
            endIndent: 10.0,
            indent: 10.0,
          ),
          const RepeatIn(),
          const AlarmName(),
          const AlarmSound(),
          const AlarmVolume(),
          const AlarmWithVibration(),
        ]),
      ),
    );
  }
}

