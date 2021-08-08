import 'package:bloc/bloc.dart';
import 'package:flutter_clock/data/models/Alarm.dart';
import 'package:flutter_clock/utils/alarm_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'alarmview_state.dart';

class AlarmviewCubit extends Cubit<AlarmviewState> {
  AlarmviewCubit() : super(AlarmviewInitial());

  final GlobalKey<AnimatedListState> animatedListState =
      GlobalKey<AnimatedListState>();

  final List<AlarmInfo> _alarms = [];

  AlarmHelper alarmHelper;

  init() async {
    alarmHelper = AlarmHelper();

    alarmHelper.initializeDatabase().then((value) {
      print("+++++++++++++++++DATA BASE INITIALISED+++++++++++++++");
    });

    alarmHelper.getAlarms().then((value) {
      _addAlarmsStoredInDB(value);
    });
  }

  void _addNewAlarmToList() {
    if (animatedListState.currentState != null) {
      animatedListState.currentState
          .insertItem(0, duration: Duration(seconds: 1));
    }
  }

  get alarms => _alarms;

  void _addAlarmsStoredInDB(List<AlarmInfo> alarms) {
    _alarms.addAll(alarms);

    if (_alarms.isEmpty) {
      emit(AlarmviewEmpty());
    } else {
      emit(AlarmviewNotEmpty());
    }
  }


    String getAlarmIn(int h,int m) {
    final DateTime now = DateTime.now();

    DateTime selectedTime = DateTime(
        now.year, now.month, now.day, h, m, now.second);
    final bool isAfter = now.isAfter(selectedTime);

    int msec;

    if (isAfter) {
      selectedTime = selectedTime.add(Duration(days: 1));
      msec = selectedTime.difference(now).inMilliseconds;
    } else {
      msec = selectedTime.difference(now).inMilliseconds;
    }


 final String hour =
        (msec / (1000 * 3600)).floor().toString().padLeft(2, "0");
    final String minute =
        (msec / (60 * 1000) % 60).floor().toString().padLeft(2, "0");

    if (hour=="00"){
      return "Alarm in $minute ${int.parse(minute) > 1 ? "mins" : "min"}";
    }else if (minute=="00"){
      return "Alarm in $hour ${int.parse(hour) > 1 ? "hours" : "hour"}";
    }

    return "Alarm in $hour ${int.parse(hour) > 1 ? "hours" : "hour"} $minute ${int.parse(minute) > 1 ? "mins" : "min"}";
  
  }

  void addAlarm(AlarmInfo alarmInfo) {
    
    alarmHelper.insertAlarm(alarmInfo).then((value) {
    
      _alarms.insert(0,alarmInfo);

      _addNewAlarmToList();

      if (_alarms.length == 1) {
        emit(AlarmviewNotEmpty());
      }
    
    });
  
  }

}
