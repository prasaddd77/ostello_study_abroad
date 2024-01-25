import 'package:flutter/foundation.dart';

class Exam3Provider extends ChangeNotifier {
  bool _preparationStatus = false;

  bool get preparationStatus => _preparationStatus;

  void setPreparationStatus(bool value) {
    _preparationStatus = value;
    notifyListeners();
  }
}
