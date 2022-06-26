import 'package:flutter/material.dart';
import 'package:music_quizz/container/first_screen.dart';
import 'package:music_quizz/container/notes_screen.dart';
import 'package:music_quizz/container/start_quizz.dart';

Map<String, WidgetBuilder> appRoute = {
  '/': (context) => const NotesScreen(),
  '/detail': (context) => const NoteDetailScreen(),
  '/home': (context) => const StartQuizz(),
};
