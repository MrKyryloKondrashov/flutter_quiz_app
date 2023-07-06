import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummaryColumn extends StatelessWidget {
  const QuestionSummaryColumn(
      {super.key,
      required this.question,
      required this.userAnswer,
      required this.correctAnswer,
      required this.correctColor,
      required this.wrongColor});

  final String question;
  final String userAnswer;
  final String correctAnswer;
  final Color correctColor;
  final Color wrongColor;

  @override
  Widget build(context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            correctAnswer,
            style: TextStyle(color: correctColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(userAnswer, style: TextStyle(color: wrongColor)),
        ],
      ),
    );
  }
}
