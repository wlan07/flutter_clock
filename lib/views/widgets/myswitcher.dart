import 'package:flutter/material.dart';

class MySwitcher extends StatefulWidget {

  final bool value;
  final ValueChanged<bool> onChanged;
  
  final Color activeColor;

  const MySwitcher({Key key, this.value, this.onChanged, this.activeColor})
      : super(key: key);

  @override
  _MySwitcherState createState() => _MySwitcherState();
}

class _MySwitcherState extends State<MySwitcher>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
             !_animationController.isCompleted
                ? widget.onChanged(!widget.value)
                : widget.onChanged(widget.value);
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          child: Container(
            width: 55.0,
            height: 28.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? Colors.grey
                    : widget.activeColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4.0, right: 4.0, left: 4.0),
              child: Align(
                    alignment: _circleAnimation.value,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
