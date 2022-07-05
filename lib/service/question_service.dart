import 'dart:convert';

import 'package:http/http.dart';

import '../model/question.dart';

class QuestionService {
  static Future<List<Question>> getQuestions() async {
    Response response = await get(Uri.parse(
        "https://the-trivia-api.com/api/questions?categories=music&limit=10"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      List<Question> list = List.empty();
      for (var element in json) {
        var question = Question.fromJson(element);
        list = [...list, question];
      }

      return list;
    } else {
      throw "Unable to get questions";
    }
  }
}
