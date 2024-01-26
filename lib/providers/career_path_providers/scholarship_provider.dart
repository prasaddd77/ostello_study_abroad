import 'package:flutter/foundation.dart';

class ScholarshipProvider extends ChangeNotifier {
  bool _isYesSelected = false;
  bool _isNoSelected = false;

  bool get isYesSelected => _isYesSelected;
  bool get isNoSelected => _isNoSelected;

  void selectYes() {
    _isYesSelected = true;
    _isNoSelected = false;
    notifyListeners();
  }

  void selectNo() {
    _isNoSelected = true;
    _isYesSelected = false;
    notifyListeners();
  }
}
