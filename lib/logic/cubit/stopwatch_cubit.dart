import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  StopwatchCubit() : super(StopwatchInitial());

  Timer _timer;

  ValueNotifier<int> _millisecNotifier = ValueNotifier<int>(0);

  get millisec => _millisecNotifier;

  set millisecValue(int n) {
    _millisecNotifier.value = n;
  }

  get millisecValue => _millisecNotifier.value;

  int ticks = 0;

  AnimationController _animationController;

  set setanimationController(AnimationController _) {
    _animationController = _;
  }

  void _handle(Timer timer) {
    millisecValue = (timer.tick + ticks) * 30;
  }

  void forward() async {
    emit(StopWatchStarted());
    _timer = Timer.periodic(Duration(milliseconds: 30), _handle);
  }

  void pause() {
    emit(StopWatchPaused());
    ticks += _timer?.tick;
    _timer?.cancel();
  }

  void _animateTimeWidget() {
    if (_animationController != null) {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }


  void reset() {
    emit(StopwatchInitial());
    _animateTimeWidget();
    ticks = 0;
    millisecValue = 0;
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _millisecNotifier?.dispose();
    _timer?.cancel();
    return super.close();
  }
}
