import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _startValue = 25.0;
  double _endValue = 125.0;

  double get startValue => _startValue;
  double get endValue => _endValue;

  void updateValues(double start, double end) {
    _startValue = start;
    _endValue = end;
    notifyListeners();
  }
}
