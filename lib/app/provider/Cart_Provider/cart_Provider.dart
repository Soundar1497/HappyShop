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
  }
}
