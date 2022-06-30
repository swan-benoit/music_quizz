import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_quizz/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_quizz/firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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


