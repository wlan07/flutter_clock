import 'dart:math';
import 'package:flutter/widgets.dart';

class StaticStopWatchTimerPainter extends CustomPainter {

  
  const  StaticStopWatchTimerPainter();

  @override
  void paint(Canvas canvas, Size size) {

    print("STATIC STOP WATCH PAINTER BUILDED");

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
        3 * _minDiameter / 7.2,
        Paint()
          ..color = Color(0xffd4a9b1)
          ..style = PaintingStyle.stroke);

  

  }

  @override
  bool shouldRepaint( StaticStopWatchTimerPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics( StaticStopWatchTimerPainter oldDelegate) => false;
}