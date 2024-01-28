import 'package:flutter/foundation.dart';

import '../../data/repositories/http_service.dart';

class Exam3Provider extends ChangeNotifier {
  bool _preparationStatus = false;

  bool get preparationStatus => _preparationStatus;

  void setPreparationStatus(bool value) {
    _preparationStatus = value;
    notifyListeners();
  }
}
