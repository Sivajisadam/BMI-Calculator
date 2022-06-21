import 'package:flutter/material.dart';

class iconContent extends StatelessWidget {
  iconContent({required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.yellow,
          size: 40,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          lable,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}