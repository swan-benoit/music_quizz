import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizzScreen extends StatelessWidget {
  const QuizzScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}
