import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter_clock/views/widgets/myswitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class AlarmWithVibration extends StatelessWidget {
  const AlarmWithVibration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Alarm with vibration",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff896d73)),
          ),
          MySwitcher(
              activeColor: Color(0xffb24f57),
              value: false,
              onChanged: (_) {
                context.read<AddalarmCubit>().togglevibration();
              })
        ],
      ),
    );
  }
}
