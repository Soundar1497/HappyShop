import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _addressIndex = 0;
  get addressIndex => _addressIndex;
  set addressIndex(value) {
    _addressIndex = value;
    print("set addressIndex : $_addressIndex");
    notifyListeners();
  }

  List _cartList = [];
  List get cartList => _cartList;

  set cartList(value) {
    _cartList.add(value);
    cartLength = _cartList.length;
    notifyListeners();
  }

  int _cartLength = 0;
  int get cartLength => _cartLength;
  set cartLength(value) {
    _cartLength = value;
    notifyListeners();
  }

  List _cartTotalPrice = [];
  List get cartTotalPrice => _cartTotalPrice;

  set cartTotalPrice(value) {
    _cartTotalPrice.add(value);
    notifyListeners();
  }

  String _dropDownValue = "1";
  String get dropDownValue => _dropDownValue;
  set dropDownValue(value) {
    _dropDownValue = value;
    notifyListeners();
  }

  TextEditingController _qtyField = TextEditingController();
  TextEditingController get qtyField => _qtyField;
  set qtyField(value) {
    _qtyField = value;
    notifyListeners();
  }
}
