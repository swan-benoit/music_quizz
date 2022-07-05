class Question {
  final String body;
  final String answer;
  final List<String> possibleAnswer;

  const Question({
    required this.body,
    required this.answer,
    required this.possibleAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> possibleAnswer =
        List.of([...json['incorrectAnswers'], json['correctAnswer']]);
    possibleAnswer.shuffle();
    return Question(
        body: json['question'],
        answer: json['correctAnswer'],
        possibleAnswer: possibleAnswer);
  }

  static Question empty() {
    return Question(body: "", answer: "", possibleAnswer: List.empty());
  }
}
