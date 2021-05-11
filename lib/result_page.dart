import 'package:flutter/material.dart';
import 'const/color.dart';
import 'const/textStyle.dart';
import 'widget/calculate_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    this.bmiResult,
    this.resulText,
    this.interpretation,
  });

  final String bmiResult;
  final String resulText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resulText.toUpperCase() ?? 'UNDEFINED',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      bmiResult ?? 'UNDEFINED',
                      style: kHeavierText,
                    ),
                    Text(
                      interpretation ?? 'UNDEFINED',
                      style: kLabelTextStyle2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            CalculateButton(
              color: kButtonColor,
              label: 'RE-CALCULATE',
              callback: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
