import 'package:flutter_clock/logic/cubit/timer_cubit.dart';
import 'package:flutter_clock/views/widgets/Animated_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TimerView.dart';
import 'timerControllers.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({Key key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  void initState() {
   /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TimerCubit>().forward();
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [const AnimatedCircleAvatar(), const TimerView()],
        ),
        const Spacer(),
        const TimerControllers(),
        const Spacer(),
      ],
    );
  }
}
