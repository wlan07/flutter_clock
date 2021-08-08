import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/logic/cubit/page_cubit.dart';
import 'AlarmScreen/AlarmScreen.dart';
import 'ClockScreen/ClockScreen.dart';
import 'StopWatchScreen.dart/stopwatchScreen.dart';
import 'TimerScreen/TimerScreen.dart';
import 'widgets/ScreenTitletopBar.dart';
import 'widgets/bottomNavBar.dart';

class MyClockHomeScreen extends StatefulWidget {
  const MyClockHomeScreen({Key key}) : super(key: key);

  @override
  _MyClockHomeScreenState createState() => _MyClockHomeScreenState();
}

class _MyClockHomeScreenState extends State<MyClockHomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  
  }

  @override
  Widget build(BuildContext context) {

    log("MyClockHomeScreen");

    return SafeArea(
      child: Material(
        textStyle: TextStyle(
              color: Color(0xff896d73),
              fontSize: 40,
              fontWeight: FontWeight.w900
          ),
        color: Color(0xfff4e1e9),
        child: Column(
            children: [
              ScreenTitleTopBar(),
              Expanded(
                  child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: context.read<PageCubit>().pageController,
                children: [
                  const Clock(),
                  const AlarmScreen(),
                  const StopWatch(),
                  const TimerScreenWrapper()
                ],
              )),
              ButtomNavBar(),
            ],
          ),
      ),
    );
  }
}
