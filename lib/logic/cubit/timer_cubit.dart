import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  ValueNotifier<int> restmSecNotifier = ValueNotifier<int>(0);
  int ticks = 0;
  int totalmSec;

// TIMER SELECT

  final ValueNotifier<bool> canStartNotifier = ValueNotifier<bool>(false);

  void canStartReCheck() {
    print("YOOOO");
    canStartNotifier.value = canStartCheck;
  }

  /// Get milli second from hour
  static int getMilliSecFromHour(int hour) => (hour * (3600 * 1000)).floor();

  /// Get milli second from minute
  static int getMilliSecFromMinute(int minute) => (minute * 60000).floor();

  /// Get milli second from second
  static int getMilliSecFromSecond(int second) => (second * 1000).floor();

  int selectedSec = 0;
  int selectedMin = 0;
  int selectedHour = 0;

  bool get canStartCheck =>
      !(selectedSec == 0 && selectedMin == 0 && selectedHour == 0);

  ValueNotifier<double> progessNotifier = ValueNotifier<double>(1.0);

  Timer _timer;

  void _handle(Timer timer) {
    restmSecNotifier.value = totalmSec - (timer.tick + ticks) * 50;
    progessNotifier.value = restmSecNotifier.value / totalmSec;
    if (restmSecNotifier.value == 0) {
      reset();
    }
  }

  void forward() async {
    totalmSec = getMilliSecFromHour(selectedHour) +
        getMilliSecFromMinute(selectedMin) +
        getMilliSecFromSecond(selectedSec);

    restmSecNotifier.value = totalmSec;

    emit(TimerStarted());

    _timer = Timer.periodic(Duration(milliseconds: 50), _handle);
  }

  void resume() {
    emit(TimerStarted());

    _timer = Timer.periodic(Duration(milliseconds: 50), _handle);
  }

  void pause() {
    emit(TimerPaused());
    ticks += _timer.tick;
    _timer?.cancel();
  }

  void reset() {
    emit(TimerInitial());
    totalmSec = 0;
    ticks = 0;
    restmSecNotifier.value = 0;
    canStartNotifier.value = true;
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    restmSecNotifier?.dispose();
    progessNotifier?.dispose();
    return super.close();
  }
}
