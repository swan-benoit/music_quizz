import 'package:flutter/material.dart';
import 'package:music_quizz/container/quizz.dart';

class StartQuizz extends StatelessWidget {
  const StartQuizz({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      minimumSize: const Size.fromHeight(45)),
                  child: const Text("Démarrer le quizz musical "),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => const QuizzScreen(),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
