import 'package:flutter_clock/logic/cubit/digitalclock_cubit.dart';
import 'package:flutter_clock/views/ClockScreen/widgets/digitalclock.dart';
import 'package:flutter/material.dart';
import '../widgets/Animated_circle_avatar.dart';
import 'widgets/ClassicClockView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*

360 degree - 60 sec -> 6
360 degree - 60 min -> 6
360 degree - 12 h -> 30 

*/

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {

    print("CLOCK BUILDED");

    return BlocProvider(
      create: (context) => DigitalclockCubit(dateTime: DateTime.now()),
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [const AnimatedCircleAvatar(), const ClockView()],
              ),
              const Spacer(),
              const DigitalClock(),
              const Spacer()
            ],
          ),
    );
  
  }
}
