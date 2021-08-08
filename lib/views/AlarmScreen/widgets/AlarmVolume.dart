import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class AlarmVolume extends StatelessWidget {
  const AlarmVolume({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alarm Volume",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff896d73)),
          ),
          ValueListenableBuilder(
            valueListenable: context.read<AddalarmCubit>().alarmVolumeNotifier,
            builder: (BuildContext context, double value, Widget child) {
              return Slider.adaptive(
                  activeColor: Color(0xffb24f57),
                  value: value,
                  onChanged: (_) {
                    context.read<AddalarmCubit>().volume = _;
                  });
            },
          ),
        ],
      ),
    );
  }
}
