import 'package:flutter_clock/views/ClockScreen/widgets/digitClockHour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'digitClockMinute.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key key}) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DigitClockHour(),
          Text(":"),
          const DigitClockMinute(),
          Text(
            " PM",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ],

      ),
    );

  }

}
