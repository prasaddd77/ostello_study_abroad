import 'package:flutter/material.dart';

import '../../data/repositories/http_service.dart';

class Exam4Provider extends ChangeNotifier{
  bool _isAware = false;

  bool get isAware => _isAware;

  void setAware(bool value){
    _isAware = value;
    notifyListeners();
  }
}