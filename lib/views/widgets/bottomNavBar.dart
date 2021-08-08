import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clock/core/constants/Myconst.dart';
import 'package:flutter_clock/logic/cubit/page_cubit.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("***BUttomNavBar Builded***");

    final PageCubit pageCubit = context.read<PageCubit>();

    return Container(
      height: kToolbarHeight * 1.5,
      width: double.infinity,
      alignment: Alignment.center,
      //color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              Myconst.buttomNavBarIcons.length,
              (index) => BlocBuilder<PageCubit, PageState>(
                    builder: (context, state) {
                      print("ITEM INDEX $index");
                      return ButtomNavBarItem(
                        model: ButtomNavBarItemModel(index,
                            iconData: Myconst.buttomNavBarIcons[index],
                            onTap: () async => pageCubit.animateTo(index),
                            selected: index == state.index),
                      );
                    },
                    buildWhen: (_, __) {
                      return _.index == index && __.index != index ||
                          __.index == index && _.index != index;
                    },
                  ))
        ],
      ),
    );
  }
}

class ButtomNavBarItem extends StatelessWidget {
  const ButtomNavBarItem({Key key, this.model}) : super(key: key);

  final ButtomNavBarItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Icon(
          model.iconData,
          color: Color(model.selected ? 0xffb24f57 : 0xff896d73),
          size: 28.0,
        ),
      ),
    );
  }
}

class ButtomNavBarItemModel {
  final Function onTap;
  final IconData iconData;
  final bool selected;
  final int index;

  ButtomNavBarItemModel(this.index, {this.onTap, this.iconData, this.selected});
}
