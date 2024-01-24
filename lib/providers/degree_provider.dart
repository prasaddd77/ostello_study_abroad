import 'package:flutter/foundation.dart';

class DegreeProvider with ChangeNotifier {
  String _selectedDegree = '';

  String get selectedDegree => _selectedDegree;

  void selectDegree(String degree) {
    _selectedDegree = degree;
    notifyListeners();
  }
  void deselectDegree() {
    _selectedDegree = '';
    notifyListeners();
  }
}