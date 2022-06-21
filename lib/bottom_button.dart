import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final onTap;
  final buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.pinkAccent[400],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}