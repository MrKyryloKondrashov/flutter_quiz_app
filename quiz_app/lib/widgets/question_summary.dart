import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_summary_circle.dart';
import 'package:quiz_app/widgets/question_summary_row.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final Color correctColor = const Color.fromARGB(255, 5, 224, 235);
  final Color wrongColor = const Color.fromARGB(160, 229, 3, 241);

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnswerBallContainer(
                    index: ((summary['question_index'] as int) + 1),
                    isAnswerCorrect:
                        summary['user_answer'] == summary['correct_answer'],
                    correctColor: correctColor,
                    wrongColor: wrongColor),
                const SizedBox(
                  width: 15,
                ),
                QuestionSummaryColumn(
                    question: summary['question'] as String,
                    userAnswer: summary['user_answer'] as String,
                    correctAnswer: summary['correct_answer'] as String,
                    correctColor: correctColor,
                    wrongColor: wrongColor),
                const SizedBox(
                  width: 15,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
