import 'package:flutter_clock/logic/cubit/digitalclock_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitClockMinute extends StatelessWidget {
  
  const DigitClockMinute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("DigitClockMinute");

    return Roulette(
        controller: (_) => context.read<DigitalclockCubit>().minuteController = _,
        duration: Duration(seconds: 2),
        infinite: false,
        animate: true,
        child: BlocBuilder<DigitalclockCubit, DigitalclockState>(
          builder: (context, state) {
            return Text(state.min.padLeft(2,"0"));
          },
        ),
        );

  }

}
