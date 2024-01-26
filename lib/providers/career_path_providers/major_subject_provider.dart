import 'package:flutter/foundation.dart';

class MajorSubjectProvider with ChangeNotifier {
  String? _selectedMajor;

  String? get selectedMajor => _selectedMajor;

  void selectMajor(String? major) {
    _selectedMajor = major;
    notifyListeners();
  }
}
