import 'package:flutter/material.dart';

class AlarmSound extends StatelessWidget {
  const AlarmSound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Alarm sound",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff896d73)),
          ),
          Text(
            "Default",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}


