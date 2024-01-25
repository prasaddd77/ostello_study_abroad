import 'package:flutter/material.dart';

class Exam1Provider extends ChangeNotifier {
  bool _isEnglishTestTaken = false;

  bool get isEnglishTestTaken => _isEnglishTestTaken;

  void setEnglishTestTaken(bool value) {
    _isEnglishTestTaken = value;
    notifyListeners();
  }
}
