import 'package:flutter/material.dart';

import '../data/data_models/study_abroad_data/add_test_prep_answers.dart';

class AnswerProvider with ChangeNotifier {
  AnswerModel _answerModel = AnswerModel(
    studentId: "009bf53a-7b7d-4385-b421-baa9524348f5",
    answers: {},
  );

  AnswerModel get answerModel => _answerModel;

  void updateAnswer(String question, dynamic answer) {
    _answerModel.answers[question] = answer;
    notifyListeners();
  }
}
