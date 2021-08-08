import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/data/models/Alarm.dart';
import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter_clock/logic/cubit/alarmview_cubit.dart';
import 'package:flutter_clock/utils/alarm_helper.dart';
import 'package:flutter_clock/views/AlarmScreen/widgets/AlarmsView.dart';
import 'package:flutter_clock/views/AlarmScreen/widgets/add_alarm.dart';
import 'package:flutter_clock/views/AlarmScreen/widgets/alarmsViewAnimatedList.dart';
import 'package:flutter_clock/views/widgets/controlButton.dart';
import 'package:flutter_clock/views/widgets/myswitcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => AlarmviewCubit()..init(),
      child: Column(
        children: [AlarmsView(), AddAlarmButton()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

//!!! NOT FINISHED YET

class AlarmItem extends StatelessWidget {
  const AlarmItem({Key key, this.alarmInfo}) : super(key: key);

  final AlarmInfo alarmInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
      child: Container(
        //color: Colors.red,
        width: double.infinity,
        height: 80,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  children: [
                    Text(
                      "${alarmInfo.hour.toString().padLeft(2, "0")} : ${alarmInfo.minute.toString().padLeft(2, "0")}",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      alarmInfo.isAm == 0 ? " AM " : " PM ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "| ${alarmInfo.alarmName}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    if (alarmInfo.isActive == 1)
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color(0xffb24f57),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Everyday",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Off",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    if (alarmInfo.isActive == 1)
                      Text(
                        context
                            .read<AlarmviewCubit>()
                            .getAlarmIn(alarmInfo.hour, alarmInfo.minute),
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffb24f57),
                            fontWeight: FontWeight.w400),
                      )
                  ],
                ),
                Spacer()
              ],
            )),
            MySwitcher(
                activeColor: Color(0xffb24f57),
                value: alarmInfo.isActive == 1,
                onChanged: (_) {
                  print("$_");
                })
          ],
        ),
      ),
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({Key key}) : super(key: key);

  Future<AlarmInfo> _showaddAlarmScreen(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (cntx) =>
          BlocProvider(create: (_) => AddalarmCubit(), child: const AddAlarm()),
      isDismissible: false,
      enableDrag: true,
      backgroundColor: Color(0xfff4e1e9),
      elevation: 10.0,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: ControlButton(
        label: "Add Alarm",
        onTap: () async => _showaddAlarmScreen(context).then((value) async {
          context.read<AlarmviewCubit>().addAlarm(value);
        }),
      ),
    );
  }
}
