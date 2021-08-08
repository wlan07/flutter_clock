import 'package:flutter_clock/logic/cubit/stopwatch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart' as a;

class StopWatchTimeView extends StatelessWidget {
  const StopWatchTimeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("STOP WATCH TIME VIEW");
    
    final StopwatchCubit stopwatchCubit = context.read<StopwatchCubit>();

    return a.Swing(
      controller: (_) => stopwatchCubit.setanimationController = _,
      animate: true,
      duration: Duration(seconds: 1),
      child: TimeView(stopwatchCubit.millisec)
    );
  }
}

class TimeView extends AnimatedWidget{

final ValueNotifier<int> animation;

  const TimeView(this.animation):super(listenable: animation);


static String getDisplayName(int msec) {
    final String hour =
        (msec / (1000 * 3600)).floor().toString().padLeft(2, "0");
    final String sec = (msec % 60000 / 1000).floor().toString().padLeft(2, "0");
    final String minute =
        (msec / (60 * 1000) % 60).floor().toString().padLeft(2, "0");
    final String mSec = (msec % 1000 / 10).floor().toString().padLeft(2, "0");

    return "$hour:$minute:$sec.$mSec";
  }


  @override
  Widget build(BuildContext context) {
    return Text(getDisplayName(animation.value));
  }

  
}
