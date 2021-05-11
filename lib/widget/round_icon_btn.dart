import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.callback});

  final IconData icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: Icon(icon ?? Icons.add),
      constraints: BoxConstraints(
        minWidth: 56,
        minHeight: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
