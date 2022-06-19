import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Text('me to navigate'),
    );
  }
}
