import 'package:flutter_clock/logic/cubit/digitalclock_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitClockHour extends StatelessWidget {
  const DigitClockHour({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DigitClockHour");

    return Roulette(
      controller: (_) => context.read<DigitalclockCubit>().hourController = _,
      duration: Duration(seconds: 2),
      infinite: false,
      animate: true,
      child: BlocBuilder<DigitalclockCubit, DigitalclockState>(
        builder: (context, state) {
          return Text(state.hour.padLeft(2,"0"));
        },
        buildWhen: (_, __) => _.hour != __.hour,
      ),
    );
  }
}
