import 'package:flutter/material.dart';
import '../constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        color: kSecondaryColor,
        size: 120,
      ),
      const SizedBox(
        height: 10.0,
      ),
      Text(
        text,
        style: kTitleTextStyle,
      )
    ]);
  }
}
