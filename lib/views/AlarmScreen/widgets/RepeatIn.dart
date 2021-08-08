import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/logic/cubit/addalarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'RepeatWeekDayItem.dart';

class RepeatIn extends StatelessWidget {
  const RepeatIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Repeat",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
              Text(
                "Weekdays",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          ValueListenableBuilder(
            valueListenable:
                context.read<AddalarmCubit>().weekDaysRepeatNotifier,
            builder: (BuildContext context, List<bool> value, Widget child) {
              return Row(
                children: [
                  ...List.generate(
                      value.length,
                      (index) => Expanded(
                            child: RepeatWeekDayItem(
                              onTap: () => context
                                  .read<AddalarmCubit>()
                                  .toggleDay(index),
                              s: value[index],
                              week: Myconst.days[index].substring(0, 3),
                            ),
                          ))
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
