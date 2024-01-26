import 'package:flutter/foundation.dart';

class Exam6Provider extends ChangeNotifier {
  String? _selectedYear;

  String? get selectedYear => _selectedYear;

  void selectYear(String? value) {
    _selectedYear = value;
    notifyListeners();
  }
}
