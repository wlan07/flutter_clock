import 'package:flutter_clock/logic/cubit/stopwatch_cubit.dart';
import 'package:flutter_clock/views/widgets/controlButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopWatchControllers extends StatelessWidget {
  const StopWatchControllers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchCubit, StopwatchState>(
      builder: (context, state) {
        if (state is StopwatchInitial){
          return ControlButton(
            label: "START",
            onTap: ()async=>context.read<StopwatchCubit>().forward(),
          );
        }else if (state is StopWatchPaused){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlButton(
                label: "RESUME",
                onTap: ()=>context.read<StopwatchCubit>().forward(),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ControlButton(
                label: "RESET",
                onTap: ()=>context.read<StopwatchCubit>().reset(),
              ),
            ],
          );
        }
        return ControlButton(
          label: "PAUSE",
          onTap: ()=>context.read<StopwatchCubit>().pause(),
        );
      },
    );
  }
}

