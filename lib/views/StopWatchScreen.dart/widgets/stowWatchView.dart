import 'package:flutter_clock/logic/cubit/stopwatch_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:flutter_clock/views/widgets/staticStopWatchPainter.dart';
import 'package:flutter/material.dart';
import 'StopWatchtimeView.dart';
import 'customprogresspainter.dart';

class StopWatchView extends StatelessWidget {
  const StopWatchView({Key key}) : super(key: key);

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
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.7,
            child: FittedBox(
              alignment: Alignment.center,
              child: StopWatchTimeView(),
              fit: BoxFit.scaleDown,
            ),
          ),
          RepaintBoundary(
            child: CustomPaint(
                painter: CustomProgessCirclePainter(
                    context.read<StopwatchCubit>().millisec)),
          ),
        ],
      ),
    );
  }
}
