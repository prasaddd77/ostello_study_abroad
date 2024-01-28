import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_list.dart';

import '../../data/repositories/http_service.dart';

class Exam1Provider extends ChangeNotifier {
  bool _isEnglishTestTaken = false;
  List<Map<String, dynamic>> _questions = [];
  List<String> year = [];

  bool get isEnglishTestTaken => _isEnglishTestTaken;

  void setEnglishTestTaken(bool value) {
    _isEnglishTestTaken = value;
    print(isEnglishTestTaken);
    notifyListeners();
  }

  List<Map<String, dynamic>> get questions => _questions;

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final data = await HttpService().getStudyAbroadQuestions();
      _questions = List<Map<String, dynamic>>.from(data['questions']);
      notifyListeners();
      return data;
    } catch (error) {
      // Handle error
      print(error);
      return {};
    }
  }

  void updateYearMyList() {
    year = _questions[5]['options'].values.toList();
  }
}
