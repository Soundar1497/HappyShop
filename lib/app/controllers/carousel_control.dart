import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarouselListener extends ChangeNotifier {
  bool _brandValue = false;
  bool get brandValue => _brandValue;

  set brandValue(bool value) {
    _brandValue = !value;
    notifyListeners();
  }

  bool _genderEdit = true;
  bool get genderEdit => _genderEdit;

  set genderEdit(bool value) {
    _genderEdit = value;
    notifyListeners();
  }

  Future GenderValueGet() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getBool("Gender");
  }

  GenderValueSet() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("Gender", _gender);
  }

  bool _gender = true;
  bool get gender => _gender;

  set gender(bool value) {
    _gender = value;
    notifyListeners();
  }

  // Dashboard page index
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
