import 'package:flutter_clock/logic/cubit/timer_cubit.dart';
import 'package:flutter_clock/views/TimerScreen/widgets/timerRestTimeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timerprogesspainter.dart';

class TimerProgressView extends StatelessWidget {
  const TimerProgressView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("Timer Circle View Builded");

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          alignment: Alignment.center,
          widthFactor: 0.7,
          child: FittedBox(
            alignment: Alignment.center,
            child: RestTimeView(context.read<TimerCubit>().restmSecNotifier),
            fit: BoxFit.scaleDown,
          ),
        ),
        RepaintBoundary(
            child: CustomPaint(
                painter: TimerProgessPainter(
                    context.read<TimerCubit>().progessNotifier))),
      ],
    );
  }
}
