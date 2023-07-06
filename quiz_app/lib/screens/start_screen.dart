import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuizFunction});

  final Function() startQuizFunction;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
          color: const Color.fromARGB(100, 255, 255, 255),
        ),
        sizedBoxWidget(),
        const Text('Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 28)),
        sizedBoxWidget(),
        OutlinedButton.icon(
          icon: const Icon(Icons.arrow_circle_right_outlined),
          onPressed: startQuizFunction,
          style: OutlinedButton.styleFrom(backgroundColor: Colors.deepPurple, textStyle: const TextStyle(color: Colors.white)),
          label: const Text('Start Quiz', style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }

  Widget sizedBoxWidget() {
    return const SizedBox(height: 25);
  }
}
