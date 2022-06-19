import 'package:flutter/material.dart';
import 'package:music_quizz/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteApp',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primaryColor: Colors.amberAccent),
      initialRoute: '/',
      routes: appRoute,
    );
  }
}


