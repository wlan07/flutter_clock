import 'package:flutter/material.dart';

class RepeatWeekDayItem extends StatelessWidget {
  const RepeatWeekDayItem({Key key, this.week, this.s, this.onTap}) : super(key: key);
  final String week;
  final bool s;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: !s
                ? Color(0xffd4a9b1).withOpacity(0.7)
                : Color(0xffb24f57)),
        child: Center(
          child: Text(
            "$week",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,color: s ?Colors.white:Colors.black)
          ),
        ),
      ),
    );
  }
}
