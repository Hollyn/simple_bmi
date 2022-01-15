import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 0.0,
      fillColor: kButtonColor,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        height: 48.0,
        width: 48.0,
      ),
    );
  }
}
