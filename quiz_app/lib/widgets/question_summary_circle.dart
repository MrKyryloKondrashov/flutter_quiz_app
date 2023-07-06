import 'package:flutter/material.dart';

class AnswerBallContainer extends StatelessWidget {

  const AnswerBallContainer({super.key, required this.index, required this.isAnswerCorrect, required this.correctColor, required this.wrongColor});

  final int index;
  final bool isAnswerCorrect;
  final Color correctColor;
  final Color wrongColor;

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: isAnswerCorrect
            ? correctColor
            : wrongColor,
        borderRadius: BorderRadius.circular(30),
        //more than 50% of width makes circle
      ),
      child: Text(
        '$index',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
