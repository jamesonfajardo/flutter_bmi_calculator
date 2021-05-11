import 'package:bmi_calculator/const/textStyle.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'widget/reusable_card.dart';
import 'widget/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'enum/gender.dart';
import 'package:bmi_calculator/const/color.dart';
import 'widget/round_icon_btn.dart';
import 'widget/calculate_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double sliderVal = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    callback: () =>
                        setState(() => selectedGender = Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    callback: () =>
                        setState(() => selectedGender = Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderVal.toStringAsFixed(0),
                        style: kHeavyText,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      trackHeight: 2,
                      thumbColor: kButtonColor,
                      overlayColor: Color(0x77eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: sliderVal,
                      min: 120,
                      max: 220,
                      // activeColor: kButtonColor,
                      // inactiveColor: Color(0xff8d8e98),
                      onChanged: (double dragVal) {
                        setState(() {
                          sliderVal = dragVal;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeavyText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              callback: () {
                                setState(() {
                                  --weight;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              callback: () {
                                setState(() {
                                  ++weight;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeavyText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              callback: () {
                                setState(() {
                                  --age;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              callback: () {
                                setState(() {
                                  ++age;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            color: kButtonColor,
            label: 'CALCULATE BMI',
            callback: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: sliderVal.toInt(), weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            interpretation: calc.getInterpretation(),
                            resulText: calc.getResult(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
