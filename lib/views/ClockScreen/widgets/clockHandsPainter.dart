import 'dart:math';
import 'package:flutter/material.dart';

class ClockHandsPainter extends CustomPainter {

  final DateTime dateTime;
  final Animation animation;

  const ClockHandsPainter(this.animation,this.dateTime):super(repaint: animation);

  double get animValue=>animation.value;

  double get sec => (60*(animValue-1)+dateTime.second);
  double get minute => 30*(animValue-1)+dateTime.minute;
  double get hour => 15*(animValue-1)+dateTime.hour;





  @override
  void paint(Canvas canvas, Size size) {
    

    print("YOOOOOOOO");

    /*print("SEC $sec");
    print("MIN $minute");
    print("HOUR $hour");*/

    final _center = Offset(size.width / 2, size.height / 2);
    final _minHalfDiameter = min(size.width, size.height)/2;

    final _secHandLength = _minHalfDiameter/1.55;
    final _minHandLength = _minHalfDiameter/2;
    final _hourHandLength = _minHalfDiameter/2.4;

    // Draw Hour Hand

    final _hourHandP2 = _center.translate(
        _hourHandLength * cos((hour * 30 + minute * 0.5) * pi / 180),
        _hourHandLength * sin((hour * 30 + minute * 0.5) * pi / 180));
    final _hourHandPaint = Paint()
      ..color = Color(0xffb24f57)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    canvas.drawLine(_center, _hourHandP2, _hourHandPaint);

    // Draw Min

    final _minHandP2 = _center.translate(
        _minHandLength * cos(minute * 6 * pi / 180), _minHandLength * sin(minute * 6 * pi / 180));

    final _minHandPaint = Paint()
      ..color = Color(0xffb24f57)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    canvas.drawLine(_center, _minHandP2, _minHandPaint);

    // Draw Sec Hand

    final _secHandP2 = _center.translate(
         _secHandLength * cos(sec * 6 * pi / 180), _secHandLength * sin(sec * 6 * pi / 180));
    final _secHandPaint = Paint()
      ..color = Color(0xffb24f57)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(_center, _secHandP2, _secHandPaint);
  }

  @override
  bool shouldRepaint(ClockHandsPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockHandsPainter oldDelegate) => false;
}