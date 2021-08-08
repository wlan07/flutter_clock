import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'digitalclock_state.dart';

class DigitalclockCubit extends Cubit<DigitalclockState> {
  DigitalclockCubit({@required DateTime dateTime})
      : super(DigitalclockInitial(
            hour: dateTime.hour == 0 ? "12" : dateTime.hour.toString(),
            min: dateTime.minute.toString()));

  AnimationController minuteAnimationController;

  set minuteController(AnimationController _) {
    minuteAnimationController = _;
  }

  void checkMinuteHour(String min, String hour) {
    if (min != state.min && hour != state.hour) {
      emit(DigitalclockState(hour: hour, min: min));
    } else if (min != state.min) {
      emit(DigitalclockState(hour: hour, min: min));
    }else if (hour != state.hour){
      emit(DigitalclockState(hour: hour, min: min));
    }else{
      return;
    }

  }

  void changeMinute(String min) async {
    if (minuteAnimationController != null) {
      emit(DigitalclockState(hour: state.hour, min: min));
      if (minuteAnimationController.isCompleted) {
        minuteAnimationController.reverse();
      } else {
        minuteAnimationController.forward();
      }
    }
  }

  AnimationController hourAnimationController;

  set hourController(AnimationController _) {
    hourAnimationController = _;
  }

  void changeMinuteandHour(String hour, String min) {
    emit(DigitalclockState(hour: hour, min: min));

    if (minuteAnimationController != null) {
      if (minuteAnimationController.isCompleted) {
        minuteAnimationController.reverse();
      } else {
        minuteAnimationController.forward();
      }
    }

    if (hourAnimationController != null) {
      if (hourAnimationController.isCompleted) {
        hourAnimationController.reverse();
      } else {
        hourAnimationController.forward();
      }
    }
  }
}
