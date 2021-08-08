import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class AddAlarmTopBar extends StatelessWidget {
  const AddAlarmTopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            splashRadius: 20.0,
            alignment: Alignment.center,
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Add alarm",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Navigator.of(context)
                .pop(context.read<AddalarmCubit>().alarmInfo),
            splashRadius: 20.0,
            alignment: Alignment.center,
            color: Color(0xffb24f57),
            icon: Icon(Icons.check),
          )
        ],
      ),
    );
  }
}
