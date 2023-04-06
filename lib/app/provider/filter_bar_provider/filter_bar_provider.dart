import 'package:flutter/material.dart';

class FilterListener with ChangeNotifier {
//  Provider for sort by

  bool _sortBool = true;
  bool get sortBool => _sortBool;
  set sortBool(bool value) {
    _sortBool = value;
    notifyListeners();
  }

  bool _sortRele = false;
  bool get sortRele => _sortRele;
  set sortRele(bool value) {
    _sortRele = value;
    notifyListeners();
  }

  bool _filterBool = false;
  bool get filterBool => _filterBool;
  set filterBool(bool value) {
    _filterBool = value;
    notifyListeners();
  }

//  Provider for filter

  bool _brandBool = false;
  bool get brandBool => _brandBool;
  set brandBool(bool value) {
    _brandBool = value;
    notifyListeners();
  }
}
