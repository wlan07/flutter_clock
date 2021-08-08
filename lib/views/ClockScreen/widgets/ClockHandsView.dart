import 'dart:async';
import 'package:flutter_clock/logic/cubit/digitalclock_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'clockHandsPainter.dart';

class ClockHandsView extends StatefulWidget {
  const ClockHandsView({Key key}) : super(key: key);

  @override
  _ClockHandsViewState createState() => _ClockHandsViewState();
}

class _ClockHandsViewState extends State<ClockHandsView>
    with SingleTickerProviderStateMixin,WidgetsBindingObserver{

  Timer timer;
  AnimationController animationController;
  Animation<double> animation;

  Duration _animationDuration = const Duration(seconds: 2);

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    animationController = AnimationController(
        duration: _animationDuration,
        lowerBound: 0.0,
        upperBound: 1.0,
        value: 0.0,
        vsync: this);

    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animationController.forward().whenComplete(() {
      _animationDuration = Duration.zero;
      timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  getValideMinute(int m) {
    return m.toString();
  }

  getValideHour(int h) {
    return h == 0 ? "12" : h.toString();
  }

  @override
  Widget build(BuildContext context) {
    
    DateTime now = DateTime.now();

    if (animationController.isCompleted) {
      if (now.second == 0 && now.minute == 0) {
        context.read<DigitalclockCubit>().changeMinuteandHour(
            getValideHour(now.hour), getValideMinute(now.minute));
      } else if (now.second == 0) {
        context
            .read<DigitalclockCubit>()
            .changeMinute(getValideMinute(now.minute));
      }
    }
    return CustomPaint(
      painter: ClockHandsPainter(animation, now.add(_animationDuration)),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
        if (state == AppLifecycleState.resumed){
            DateTime now = DateTime.now();
            context.read<DigitalclockCubit>().checkMinuteHour(getValideMinute(now.minute), getValideHour(now.hour));
        } 
    }

}
