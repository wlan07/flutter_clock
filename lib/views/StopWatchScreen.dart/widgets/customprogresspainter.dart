import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomProgessCirclePainter extends CustomPainter {



  final ValueNotifier<int> animation;
  
  const CustomProgessCirclePainter(this.animation):super(repaint: animation);


  double get percent=>(animation.value%60000)/60000;

  @override
  void paint(Canvas canvas, Size size) {

    //print("CUSTOM PROGRESS BAR PAINTER BUILDED !");

    print("PERCENT TO SEC ${percent*60}");

    // GLOBAL CONFIG

    final _center = Offset(size.width / 2, size.height / 2);
    final _minDiameter = min(size.width, size.height);
    final _progessCircle = Paint()
      ..color = Color(0xffab3c43)
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    
    // Draw small Circle

        canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        height: 3*_minDiameter/3.6,
        width: 3*_minDiameter/3.6,
      ),
      -pi/2,
      percent*2*pi,
      false,
      _progessCircle,
    );


  }

  @override
  bool shouldRepaint(CustomProgessCirclePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomProgessCirclePainter oldDelegate) => false;
}
