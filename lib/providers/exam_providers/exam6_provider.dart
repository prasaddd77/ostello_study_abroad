import 'package:flutter/foundation.dart';

import '../../data/repositories/http_service.dart';

class Exam6Provider extends ChangeNotifier {
  String? _selectedYear;

  String? get selectedYear => _selectedYear;

  void selectYear(String? value) {
    _selectedYear = value;
    notifyListeners();
  }
}
