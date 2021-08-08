import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter_clock/core/constants/Myconst.dart';

class AnimatedCircleAvatar extends StatelessWidget {
  const AnimatedCircleAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("AnimatedCircleAvatar Builded");

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: FlareActor.asset(
          AssetFlare(bundle: rootBundle, name: Myconst.filesToWarmup[0]),
          alignment: Alignment.center,
          color: Color(0xffd4a9b1),
          animation: "Alarm",
        ));
  }
}

/*class ClassicClockBackPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Path path = Path();


    path.moveTo(0, size.height/4);
    path.quadraticBezierTo(size.width/4, - 80.0 , size.width/2, 0);
    path.quadraticBezierTo(3*size.width/4-20.0, 80.0 , 3*size.width/4, 20.0);

    canvas.drawPath(path,Paint()..color=Color(0xffb24f57));

    

  }

  @override
  bool shouldRepaint(ClassicClockBackPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ClassicClockBackPainter oldDelegate) => false;
}*/
