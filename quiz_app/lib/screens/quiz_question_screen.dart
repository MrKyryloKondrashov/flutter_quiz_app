import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/anser_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key, required this.addSelectedAnswer});

  final void Function(String answer) addSelectedAnswer;

  @override
  State<QuizQuestion> createState() {
    return _QuizQuestionState();
  }
}

class _QuizQuestionState extends State<QuizQuestion> {
  var currentQuestion = 0;
  

  answerQuestion(String selectedAnswers){
    setState(() {
      currentQuestion += 1;
      widget.addSelectedAnswer(selectedAnswers);
    });
  }
  _QuizQuestionState();

  @override
  Widget build(conext) {
    final currenQuenstion = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currenQuenstion.questionText,
              style:  GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currenQuenstion.shuffleAnswers().map((e) => AnswerButton(answerText: e, onTap: (){
              answerQuestion(e);
            })),
          ],
        ),
      ),
    );
  }
}
