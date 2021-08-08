import 'package:flutter_clock/logic/cubit/alarmview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import 'alarmsViewAnimatedList.dart';

class AlarmsView extends StatelessWidget {
  const AlarmsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<AlarmviewCubit, AlarmviewState>(
      builder: (context, state) {
        if (state is AlarmviewInitial) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xfff4e1e9)),
            ),
          );
        } else if (state is AlarmviewEmpty) {
          return Center(
            child: Text("NO ALARMS YET !",style: TextStyle(
              fontSize: 25.0
            ),),
          );
        }
        return AlarmsViewAnimatedList();
      },
    ));
  }
}
