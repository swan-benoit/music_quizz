import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizzScreen extends StatefulWidget {
  final List<bool> isSelected = List.of([false, false]);

  QuizzScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizzScreen();
}

class _QuizzScreen extends State<QuizzScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text("voici la question", style: TextStyle(fontSize: 24.0)),
            ),
            ToggleButtons(
                direction: Axis.vertical,
                isSelected: widget.isSelected,
                children: const [Text("reponse A"), Text("reponse B")])
          ],
        ),
      ),
    );
  }
}
