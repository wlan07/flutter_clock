import 'dart:math';
import 'package:flutter/widgets.dart';

class StaticClockPainter extends CustomPainter {


  const StaticClockPainter();

  @override
  void paint(Canvas canvas, Size size) {

    print("STATIC CLOCK BUILDED");

    // GLOBAL CONFIG

    final _center = Offset(size.width / 2, size.height / 2);
    final _minDiameter = min(size.width, size.height);

    // Draw Big Circle Shadow

    canvas.drawShadow(
        Path()
          ..addOval(
            Rect.fromCircle(
                center: Offset(size.width / 2, size.height / 2),
                radius: (_minDiameter / 2)+1.0),
          ),
        Color(0xffab3c43),
        1.0,
        true);

    // Draw Bigger Circle

    canvas.drawCircle(
        _center, _minDiameter / 2, Paint()..color = Color(0xfff4e1e9));

    // Draw small Circle

    canvas.drawCircle(
        _center,
        3 * _minDiameter / 8,
        Paint()
          ..color = Color(0xffd4a9b1)
          ..style = PaintingStyle.stroke);

    // Draw center Circle

    canvas.drawCircle(_center, 10.0, Paint()..color = Color(0xffb24f57));

    //Drawing Indic DASH

    for (int i = 0; i < 360; i += 30) {
      final bool isMain = i % 90 == 0;

      canvas.drawLine(
          _center.translate(
              (7 * _minDiameter / 16 + (isMain ? 7.0 : 5.0)) *
                  cos(i * pi / 180),
              (7 * _minDiameter / 16 + (isMain ? 7.0 : 5.0)) *
                  sin(i * pi / 180)),
          _center.translate(
              (7 * _minDiameter / 16 - (isMain ? 7.0 : 5.0)) *
                  cos(i * pi / 180),
              (7 * _minDiameter / 16 - (isMain ? 7.0 : 5.0)) *
                  sin(i * pi / 180)),
          Paint()
            ..color = Color(isMain ? 0xffb24f57 : 0xff896d73)
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 3.0);
    }
  }

  @override
  bool shouldRepaint(StaticClockPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(StaticClockPainter oldDelegate) => false;
}