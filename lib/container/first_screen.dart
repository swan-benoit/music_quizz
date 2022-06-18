import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_quizz/app_routes.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () { Navigator.pushNamed(context, '/login'); }, child: Text('me to navigate'),);
  }
}


