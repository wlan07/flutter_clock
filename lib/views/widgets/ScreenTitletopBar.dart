import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart' as animate;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/logic/cubit/page_cubit.dart';

class ScreenTitleTopBar extends StatelessWidget {
  const ScreenTitleTopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight * 1.5,
        alignment: Alignment.center,
        width: double.infinity,
        child: animate.Flash(
          controller: (_)=>context.read<PageCubit>().titleController=_,
          child: BlocBuilder<PageCubit, PageState>(
            builder: (context, state) {
              return Text(
                Myconst.titles[state.index],
                style: TextStyle(
                    color: Color(0xff896d73),
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    letterSpacing: 1.5),
              );
            },
          ),
          animate: true,
          duration: Duration(milliseconds: 500),
        ));
  }
}
