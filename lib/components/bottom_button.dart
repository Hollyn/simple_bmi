import 'package:flutter/material.dart';
import 'package:simple_bmi/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kBottomTextStyle,
          ),
        ),
        height: 80,
        color: kAccentColor,
      ),
    );
  }
}
