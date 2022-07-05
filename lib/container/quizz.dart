import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_quizz/model/question.dart';
import 'package:music_quizz/service/question_service.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizzScreen();
}

class _QuizzScreen extends State<QuizzScreen> {
  List<bool> _isSelected = List.of([false, false]);
  List<Question> _remainingQuestions = List.empty();
  Question _currentQuestion = Question.empty();
  num _score = 0;

  @override
  void initState() {
    QuestionService.getQuestions().then((questions) {
      setState(() {
        var currentQuestion = questions.first;
        questions.removeAt(0);
        _remainingQuestions = questions;
        _isSelected = initIsSelected(currentQuestion);
        _currentQuestion = currentQuestion;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_currentQuestion.body,
                      style: const TextStyle(fontSize: 24.0)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$_score points"),
                  ),
                ],
              ),
            ),
            _currentQuestion.possibleAnswer.length == _isSelected.length
                ? ToggleButtons(
                    direction: Axis.vertical,
                    isSelected: _isSelected,
                    onPressed: submitAnswer,
                    children: _currentQuestion.possibleAnswer
                        .map((e) => Text(e))
                        .toList(),
                  )
                : _remainingQuestions.isEmpty
                    ? const Text('Bravo')
                    : const Text('Loading')
          ],
        ),
      ),
    );
  }

  void submitAnswer(int index) {
    var userAnswer = _currentQuestion.possibleAnswer[index];

    setState(() {
      if (userAnswer == _currentQuestion.answer) {
        _score += 1;
      }
      if (_remainingQuestions.isNotEmpty) {
        _currentQuestion = _remainingQuestions.first;
        _remainingQuestions.removeAt(0);
      } else {
        _currentQuestion = Question.empty();
      }
    });
  }

  List<bool> initIsSelected(Question currentQuestion) {
    return [
      for (var i = 0; i < currentQuestion.possibleAnswer.length; i += 1) false
    ];
  }
}
