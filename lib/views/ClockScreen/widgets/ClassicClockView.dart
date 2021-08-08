import 'package:flutter_clock/views/widgets/Animated_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'ClockHandsView.dart';
import 'staticClockPainter.dart';

class ClockView extends StatelessWidget {
  const ClockView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("CLOCK VIEW");

    return SizedBox(
      height: MediaQuery.of(context).size.width * .65,
      width: MediaQuery.of(context).size.width * .65,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          RepaintBoundary(
            child: CustomPaint(
              painter: const StaticClockPainter(),
            ),
          ),
          const RotatedBox(
              quarterTurns: 3,
              child: RepaintBoundary(child: const ClockHandsView())),
        ],
      ),
    );
  }
}
