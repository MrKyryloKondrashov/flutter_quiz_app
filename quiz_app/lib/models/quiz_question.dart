class Question{
  const Question(this.questionText, this.answers);
  final String questionText;
  final List<String> answers;

  List<String> shuffleAnswers(){
    final answersCopy = List.of(answers);
    answersCopy.shuffle();
    return answersCopy;
  }

}