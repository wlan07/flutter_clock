import 'package:flutter_clock/logic/cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({Key key}) : super(key: key);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {

  ScrollController _hourscrollController;
  ScrollController _minscrollController;
  ScrollController _secscrollController;
  TimerCubit timerCubit;


   void _animateHourTo(double offset) async {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _hourscrollController.position.animateTo(offset,
            duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      });
    }

    void _animateMinTo(double offset) async {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _minscrollController.position.animateTo(offset,
            duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      });
    }

    void _animateSecTo(double offset) async {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _secscrollController.position.animateTo(offset,
            duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      });
    }

    bool _handleHourEnd(scrollNotification) {
      if (scrollNotification is ScrollEndNotification) {
        print("HOUR SCROLL END");

        final int hour = (_hourscrollController.offset / 40).round();
        timerCubit.selectedHour = hour;
        timerCubit.canStartReCheck();
        _animateHourTo((hour * 40.0));
      }
      return true;
    }

    bool _handleMinEnd(scrollNotification) {
      if (scrollNotification is ScrollEndNotification) {
        print("MIN SCROLL END");
        final int min = (_minscrollController.offset / 40).round();
        timerCubit.selectedMin = min;
        timerCubit.canStartReCheck();
        _animateMinTo(min * 40.0);
      }

      return true;
    }

    bool _handleSecEnd(scrollNotification) {
      if (scrollNotification is ScrollEndNotification) {
        print("SEC SCROLL END");
        final int sec = (_secscrollController.offset / 40).round();
        timerCubit.selectedSec = sec;
        timerCubit.canStartReCheck();
        _animateSecTo(sec * 40.0);
      }

      return true;
    }


  @override
  void initState() {
    
    _hourscrollController = ScrollController(initialScrollOffset: 4000);
    _minscrollController = ScrollController(initialScrollOffset: 2400);
    _secscrollController = ScrollController(initialScrollOffset: 2400);
    timerCubit= context.read<TimerCubit>();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _hourscrollController?.animateTo(timerCubit.selectedHour * 40.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      _minscrollController?.animateTo(timerCubit.selectedMin * 40.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      _secscrollController?.animateTo(timerCubit.selectedSec * 40.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });


    super.initState();
  }


@override
  void dispose() {
    _hourscrollController?.dispose();
    _minscrollController?.dispose();
    _secscrollController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xfff4e1e9),
        ),
        padding: const EdgeInsets.all(10.0),
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Hours",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Minutes",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Seconds",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: NotificationListener<ScrollNotification>(
                    onNotification: _handleHourEnd,
                    child: ListWheelScrollView(
                        controller: _hourscrollController,
                        physics: const BouncingScrollPhysics(),
                        overAndUnderCenterOpacity: 0.2,
                        offAxisFraction: -3,
                        useMagnifier: true,
                        itemExtent: 40,
                        children: List.generate(
                            100, (index) => Text("$index".padLeft(2, "0")))),
                  )),
                  Text(":"),
                  Expanded(
                      child: NotificationListener<ScrollNotification>(
                          onNotification: _handleMinEnd,
                          child: ListWheelScrollView(
                              controller: _minscrollController,
                              physics: const BouncingScrollPhysics(),
                              overAndUnderCenterOpacity: 0.2,
                              squeeze: 1,
                              itemExtent: 40,
                              onSelectedItemChanged: (_) {
                                timerCubit.selectedMin = _;
                                timerCubit.canStartReCheck();
                              },
                              children: List.generate(60,
                                  (index) => Text("$index".padLeft(2, "0")))))),
                  Text(":"),
                  Expanded(
                      child: NotificationListener<ScrollNotification>(
                          onNotification: _handleSecEnd,
                          child: ListWheelScrollView(
                              controller: _secscrollController,
                              physics: const BouncingScrollPhysics(),
                              overAndUnderCenterOpacity: 0.2,
                              offAxisFraction: 3.0,
                              itemExtent: 40,
                              onSelectedItemChanged: (_) {
                                timerCubit.selectedSec = _;
                                timerCubit.canStartReCheck();
                              },
                              children: List.generate(60,
                                  (index) => Text("$index".padLeft(2, "0"))))))
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ValueListenableBuilder(
              valueListenable: timerCubit.canStartNotifier,
              builder: (BuildContext context, bool value, Widget child) {
                print("HOIOIOE");

                return GestureDetector(
                  onTap: () => value ? timerCubit.forward() : "",
                  child: Opacity(
                    opacity: value ? 1.0 : 0.2,
                    child: Text(
                      "START",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
