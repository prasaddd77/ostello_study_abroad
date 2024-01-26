import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  String _selectedCountry = '';

  String get selectedCountry => _selectedCountry;

  void selectCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }
  void deselectCountry() {
    _selectedCountry = '';
    notifyListeners();
  }
}
