import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child, this.callback});

  final Color color;
  final Widget child;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
