import 'package:flutter/material.dart';

class ReUseable extends StatelessWidget {
  final Color colour;
  final cardIcon;
  final onPress;

  ReUseable({required this.colour, this.cardIcon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardIcon,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
