import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_quizz/model/question.dart';
import 'package:music_quizz/service/question_service.dart';

class QuizzScreen extends StatefulWidget {
  QuizzScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizzScreen();
}

class _QuizzScreen extends State<QuizzScreen> {
  List<bool> _isSelected = List.of([false, false]);
  List<Question> _questions = List.empty();
  Question _currentQuestion = Question.empty();
  num _score = 0;

  @override
  void initState() {
    QuestionService.getQuestions().then((questions) {
      setState(() {
        _questions = questions;
        var currentQuestion = questions.first;
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
              child: Text(_currentQuestion.body,
                  style: const TextStyle(fontSize: 24.0)),
            ),
            _currentQuestion.possibleAnswer.length == _isSelected.length
                ? ToggleButtons(
                    direction: Axis.vertical,
                    isSelected: _isSelected,
                    children: _currentQuestion.possibleAnswer
                        .map((e) => Text(e))
                        .toList())
                : const Text('Loading')
          ],
        ),
      ),
    );
  }

  List<bool> initIsSelected(Question currentQuestion) {
    return [
      for (var i = 0; i < currentQuestion.possibleAnswer.length; i += 1) false
    ];
  }
}
