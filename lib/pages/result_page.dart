import 'package:flutter/material.dart';
import 'package:simple_bmi/components/bottom_button.dart';
import 'package:simple_bmi/constants.dart';
import 'package:simple_bmi/components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.title,
    required this.interpretation,
    required this.bmi,
  }) : super(key: key);

  final String title;
  final String interpretation;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'YOUR RESULT',
            style: TextStyle(
              color: kTextColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ReusableCard(
                colour: kInactiveBackgroundColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 50),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE YOUR BMI',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
