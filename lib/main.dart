import 'package:flutter/material.dart';
import 'package:music_quizz/app_routes.dart';
import 'package:music_quizz/container/first_screen.dart';

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
      title: 'Titre pertinent',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.amberAccent
      ),
      initialRoute: '/',
      routes: appRoute,
    );
  }
}


