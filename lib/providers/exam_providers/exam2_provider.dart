import 'package:flutter/foundation.dart';

class Exam2Provider extends ChangeNotifier {
  String _enteredText = '';

  String get enteredText => _enteredText;

  void setEnteredText(String value) {
    _enteredText = value;
    notifyListeners();
  }
}
