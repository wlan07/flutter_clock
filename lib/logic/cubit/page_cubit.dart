import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState(0));

  PageController pageController;
  AnimationController animationController;


  set titleController(AnimationController _) {
    animationController = _;
  }



  void init() {
    pageController = PageController(initialPage: state.index, keepPage: true);
  }

  void animateTo(int index) async {
    emit(PageState(index));
    pageController?.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.easeInToLinear);
    if (animationController != null) {
      if (animationController.isCompleted) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
    }
  }

  @override
  Future<void> close() {
    pageController?.dispose();
    return super.close();
  }
}
