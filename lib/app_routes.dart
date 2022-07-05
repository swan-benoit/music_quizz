import 'package:flutter/material.dart';
import 'package:music_quizz/container/Signup.dart';
import 'package:music_quizz/container/quizz.dart';
import 'package:music_quizz/container/start_quizz.dart';

import 'container/Login.dart';

Map<String, WidgetBuilder> appRoute = {
  '/login': (context) => const QuizzScreen(),
  '/home': (context) => const StartQuizz(),
  '/': (context) => const Login(),
  '/sign-up': (context) => const SignIn(),
};
