import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.userAnswers, required this.resetScreen});

  final List<String> userAnswers;
  final void Function() resetScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': userAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'You answered $correctAnswers out $numTotalQuestions questions correctly!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(180, 208, 19, 218))),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary(summaryData: getSummaryData()),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                    icon: const Icon(Icons.refresh),
                    onPressed: resetScreen,
                    label: const Text("Restart quiz"))
              ],
            )));
  }
}
