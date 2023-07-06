import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class QuizContainer extends StatefulWidget {
  const QuizContainer({super.key});

  @override
  State<QuizContainer> createState() {
    return _QuizContainerState();
  }
}

class _QuizContainerState extends State<QuizContainer> {
  _QuizContainerState();

  Widget? currentScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    currentScreen =  StartScreen(startQuizFunction: changeScreen);
  }

  void changeScreen(){
    setState(() {
      currentScreen = QuizQuestion(addSelectedAnswer: addSelectedAnswer);
    });
  }

  void resetTest(){
    setState(() {
        selectedAnswers = [];
        currentScreen = StartScreen(startQuizFunction: changeScreen);
    });
  }

  void addSelectedAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        currentScreen = ResultScreen(userAnswers: selectedAnswers, resetScreen: resetTest);
      });
    }
  }

  @override
  Widget build(context) {
    return  MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Color.fromARGB(255, 93, 0, 254)])),
      child: Center(child: currentScreen),
    )));
  }
}
