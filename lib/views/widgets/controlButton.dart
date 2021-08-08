import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({Key key, this.label, this.onTap}) : super(key: key);

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: onTap,
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 20.0),
        ));
  }
}