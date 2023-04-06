import 'package:flutter/material.dart';

class SortByListener with ChangeNotifier {
//  Provider for sort by

  String _onRadioChange = "Relevance";
  String get onRadioChange => _onRadioChange;
  set onRadioChange(String val) {
    _onRadioChange = val;
    notifyListeners();
  }

  bool _sortByBool = false;
  bool get sortByBool => _sortByBool;
  set sortByBool(bool value) {
    _sortByBool = value;
    notifyListeners();
  }
}
