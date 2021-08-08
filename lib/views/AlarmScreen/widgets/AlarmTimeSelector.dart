import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmTimeSelector extends StatefulWidget {
  const AlarmTimeSelector({Key key}) : super(key: key);

  @override
  _AlarmTimeSelectorState createState() => _AlarmTimeSelectorState();
}

class _AlarmTimeSelectorState extends State<AlarmTimeSelector> {
  ScrollController _hourscrollController;
  ScrollController _minscrollController;
  AddalarmCubit addalarmCubit;

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

  bool _handleHourEnd(scrollNotification) {
    if (scrollNotification is ScrollEndNotification) {
      print("HOUR SCROLL END");

      final int hour = (_hourscrollController.offset / 40).round();
      addalarmCubit.hour = hour;
      _animateHourTo((hour * 40.0));
    }
    return true;
  }

  bool _handleMinEnd(scrollNotification) {
    if (scrollNotification is ScrollEndNotification) {
      print("MIN SCROLL END");
      final int min = (_minscrollController.offset / 40).round();
      addalarmCubit.min = min;
      _animateMinTo(min * 40.0);
    }

    return true;
  }

  @override
  void initState() {
    _hourscrollController = ScrollController(initialScrollOffset: 960);
    _minscrollController = ScrollController(initialScrollOffset: 2400);

    addalarmCubit = context.read<AddalarmCubit>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _hourscrollController?.animateTo(addalarmCubit.selectedHour * 40.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      _minscrollController?.animateTo(addalarmCubit.selectedMin * 40.0,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });

    super.initState();
  }

  @override
  void dispose() {
    _hourscrollController?.dispose();
    _minscrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Color(0xff896d73), fontSize: 40, fontWeight: FontWeight.w900),
      child: Row(
        children: [
          Spacer(),
          Expanded(
              child: NotificationListener<ScrollNotification>(
                  onNotification: _handleHourEnd,
                  child: ListWheelScrollView(
                      controller: _hourscrollController,
                      offAxisFraction: -1.0,
                      overAndUnderCenterOpacity: 0.2,
                      itemExtent: 40.0,
                      physics: BouncingScrollPhysics(),
                      children: List.generate(
                          24, (index) => Text("$index".padLeft(2, "0")))))),
          Text(":"),
          Expanded(
              child: NotificationListener<ScrollNotification>(
                  onNotification: _handleMinEnd,
                  child: ListWheelScrollView(
                      controller: _minscrollController,
                    overAndUnderCenterOpacity: 0.2,
                      offAxisFraction: 1.0,
                      physics: BouncingScrollPhysics(),
                      itemExtent: 40.0,
                      children: List.generate(
                          60, (index) => Text("$index".padLeft(2, "0")))))),
          Spacer(),
        ],
      ),
    );
  }
}
