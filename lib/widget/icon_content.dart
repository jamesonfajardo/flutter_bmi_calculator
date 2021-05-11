import 'package:flutter/material.dart';
import 'package:bmi_calculator/const/textStyle.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.add_circle_outline_sharp,
          size: 60,
        ),
        SizedBox(height: 15),
        Text(
          label ?? 'Label',
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
