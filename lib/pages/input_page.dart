import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_bmi/bmi_brain.dart';
import 'package:simple_bmi/components/bottom_button.dart';
import 'package:simple_bmi/constants.dart';
import 'package:simple_bmi/pages/result_page.dart';
import 'package:simple_bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:simple_bmi/components/round_icon_button.dart';

import '../constants.dart';
import '../components/icon_card.dart';

enum Gender { none, male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: (genderSelected == Gender.male)
                      ? kActiveBackgroundColor
                      : kInactiveBackgroundColor,
                  cardChild: const IconCard(
                    text: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                  onPress: () {
                    setState(() {
                      genderSelected = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderSelected = Gender.female;
                    });
                  },
                  colour: (genderSelected == Gender.female)
                      ? kActiveBackgroundColor
                      : kInactiveBackgroundColor,
                  cardChild: const IconCard(
                    text: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kActiveBackgroundColor,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kTitleTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: kMeasureTextStyle,
                    ),
                    const Text(
                      'CM',
                      style: kTitleTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kSecondaryColor,
                      thumbColor: kAccentColor,
                      overlayColor: kAccentColor.withAlpha(16),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    min: 120.0,
                    max: 220.0,
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();
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
                  colour: kActiveBackgroundColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kTitleTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kMeasureTextStyle,
                          ),
                          const Text(
                            'KG',
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
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
                  colour: kActiveBackgroundColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kTitleTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kMeasureTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
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
        BottomButton(
            title: 'CALCULATE YOUR BMI',
            onPressed: () {
              BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      interpretation: bmiBrain.getInterpretation(),
                      bmi: bmiBrain.getBmi(),
                      title: bmiBrain.getTitle(),
                    ),
                  ));
            }),
      ],
    );
  }
}
