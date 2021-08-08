import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/logic/cubit/timer_cubit.dart';
import 'widgets/TimerScreen.dart';
import 'widgets/timeSelector.dart';

class TimerScreenWrapper extends StatefulWidget {
  const TimerScreenWrapper({Key key}) : super(key: key);

  @override
  _TimerScreenWrapperState createState() => _TimerScreenWrapperState();
}

class _TimerScreenWrapperState extends State<TimerScreenWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("STOP WATCH BUILDED");

    return BlocProvider(
      create: (_) => TimerCubit(),
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if (state is TimerInitial) {
            return TimeSelector();
          }
          return TimerScreen();
        },
        buildWhen: (_, __) {
          return _ is TimerInitial && __ is! TimerInitial ||
              __ is TimerInitial && _ is! TimerInitial;
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
