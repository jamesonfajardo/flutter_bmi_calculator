import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.color, this.label, this.callback});

  final Color color;
  final String label;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        color: color,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 64,
        child: Center(
          child: Text(
            label ?? 'LABEL GOES HERE',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
