import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/logic/cubit/timer_cubit.dart';
import 'package:flutter_clock/views/widgets/controlButton.dart';

class TimerControllers extends StatelessWidget {
  const TimerControllers({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        if (state is TimerPaused) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlButton(
                label: "RESUME",
                onTap: () => context.read<TimerCubit>().resume(),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ControlButton(
                label: "CANAL",
                onTap: () => context.read<TimerCubit>().reset(),
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(
              label: "PAUSE",
              onTap: () => context.read<TimerCubit>().pause(),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ControlButton(
              label: "CANAL",
              onTap: () => context.read<TimerCubit>().reset(),
            ),
          ],
        );
      },
    );
  }
}
