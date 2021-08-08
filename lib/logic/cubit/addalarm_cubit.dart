import 'package:bloc/bloc.dart';
import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/data/models/Alarm.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'addalarm_state.dart';

class AddalarmCubit extends Cubit<AddalarmState> with ChangeNotifier {
  AddalarmCubit() : super(AddalarmInitial());

  final ValueNotifier<List<bool>> weekDaysRepeatNotifier =
      ValueNotifier<List<bool>>(
          List.generate(Myconst.days.length, (index) => true));

  final ValueNotifier<double> alarmVolumeNotifier = ValueNotifier<double>(0.35);

  final ValueNotifier<String> alarmTitle = ValueNotifier<String>("None");

  final ValueNotifier<int> alarmInNotifier = ValueNotifier<int>(1545455);

  bool _vibration = false;

  int selectedHour = 0;
  int selectedMin = 0;

  int getAlarmIn() {
    final DateTime now = DateTime.now();

    DateTime selectedTime = DateTime(
        now.year, now.month, now.day, selectedHour, selectedMin, now.second);
    final bool isAfter = now.isAfter(selectedTime);

    int remainingTime;

    if (isAfter) {
      selectedTime = selectedTime.add(Duration(days: 1));
      remainingTime = selectedTime.difference(now).inMilliseconds;
    } else {
      remainingTime = selectedTime.difference(now).inMilliseconds;
    }

    return remainingTime;
  }

  set min(int m) {
    selectedMin = m;
    alarmInNotifier.value = getAlarmIn();
  }

  set hour(int h) {
    selectedHour = h;
    alarmInNotifier.value = getAlarmIn();
  }



get selectedDaysToString{


final List<int> list = [];

weekDaysRepeatNotifier.value.forEach((element) {
  list.add(element?1:0);
});

return list.join("*");


}
  AlarmInfo get alarmInfo => AlarmInfo(
      alarmName: alarmTitle.value,
      soundName: "Default",
      soundVolume: alarmVolumeNotifier.value,
      vibrate: _vibration ? 1:0,
      hour: selectedHour,
      minute: selectedMin,
      isActive: 1,
      isAm: selectedHour < 12 ? 1 : 0,
      selectedays:selectedDaysToString
      );

  set title(String newTitle) => alarmTitle.value = newTitle;

  void togglevibration() {
    _vibration = !_vibration;
  }

  void toggleDay(int index) {
    weekDaysRepeatNotifier.value[index] = !weekDaysRepeatNotifier.value[index];
    weekDaysRepeatNotifier.notifyListeners();
    print(index);
  }

  set volume(double v) {
    alarmVolumeNotifier.value = v;
  }

  @override
  Future<void> close() {
    weekDaysRepeatNotifier?.dispose();
    alarmVolumeNotifier?.dispose();
    alarmInNotifier?.dispose();
    return super.close();
  }
}
