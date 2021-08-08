import 'package:flutter_clock/logic/cubit/stopwatch_cubit.dart';
import 'package:flutter_clock/views/StopWatchScreen.dart/widgets/stopWatchControllers.dart';
import 'package:flutter_clock/views/StopWatchScreen.dart/widgets/stowWatchView.dart';
import 'package:flutter_clock/views/widgets/Animated_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    print("STOP WATCH BUILDED");
    super.build(context);
    
    return BlocProvider(
      create: (_) => StopwatchCubit(),
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [const AnimatedCircleAvatar(),const StopWatchView()],
          ),
          const Spacer(),
          const StopWatchControllers(),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  
}
