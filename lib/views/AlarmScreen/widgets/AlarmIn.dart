import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;


class AlarmIn extends StatelessWidget {
  
  const AlarmIn({Key key}) : super(key: key);

  static String getDisplayName(int msec) {

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ValueListenableBuilder(
        valueListenable: context.read<AddalarmCubit>().alarmInNotifier,
        builder: (BuildContext context, int value, Widget child) {
          return Text(
            getDisplayName(value),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          );
        },
      ),
    );
  }
}
