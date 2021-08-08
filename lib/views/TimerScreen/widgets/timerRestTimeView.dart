

import 'package:flutter/material.dart';

class RestTimeView extends AnimatedWidget{

final ValueNotifier<int> animation;

  const RestTimeView(this.animation):super(listenable: animation);


static String getDisplayName(int msec) {
    final String hour =
        (msec / (1000 * 3600)).floor().toString().padLeft(2, "0");
    final String sec = (msec % 60000 / 1000).floor().toString().padLeft(2, "0");
    final String minute =
        (msec / (60 * 1000) % 60).floor().toString().padLeft(2, "0");

    return "$hour:$minute:$sec";
  }


  @override
  Widget build(BuildContext context) {
    return Text(getDisplayName(animation.value));
  }

  
}
