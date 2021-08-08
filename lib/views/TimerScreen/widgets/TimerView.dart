import 'package:flutter_clock/logic/cubit/stopwatch_cubit.dart';
import 'package:flutter_clock/views/TimerScreen/widgets/timerprogessbarView.dart';
import 'package:flutter_clock/views/widgets/staticStopWatchPainter.dart';
import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .65,
      width: MediaQuery.of(context).size.width * .65,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const RepaintBoundary(
            child: CustomPaint(
              painter: const StaticStopWatchTimerPainter(),
            ),
          ),
          const TimerProgressView(),
        ],
      ),
    );
  }
}
