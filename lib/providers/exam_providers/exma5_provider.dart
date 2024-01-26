import 'package:flutter/foundation.dart';

enum ExamType {
  online,
  offline,
}

class Exam5Provider extends ChangeNotifier {
  ExamType _examType = ExamType.online;

  ExamType get examType => _examType;

  void setExamType(ExamType type) {
    _examType = type;
    notifyListeners();
  }
}
