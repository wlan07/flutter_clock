import 'package:flutter_clock/logic/cubit/alarmview_cubit.dart';
import 'package:flutter_clock/views/AlarmScreen/AlarmScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class AlarmsViewAnimatedList extends StatelessWidget {
  const AlarmsViewAnimatedList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final AlarmviewCubit alarmviewCubit = context.read<AlarmviewCubit>();

    return AnimatedList(
      key: alarmviewCubit.animatedListState,
      padding: EdgeInsets.all(10.0),
      physics: BouncingScrollPhysics(),
      initialItemCount: alarmviewCubit.alarms.length,
      itemBuilder: (cntx, index, animation) {
        return SlideTransition(
            position:
                CurvedAnimation(parent: animation, curve: Curves.bounceInOut)
                    .drive(Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))),
            child: AlarmItem(
              alarmInfo: alarmviewCubit.alarms[index],
            ));
      },
    );
  }
}
