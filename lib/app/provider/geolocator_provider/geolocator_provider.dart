import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorProvider with ChangeNotifier {
  // TextEditingController? deliveryName;

  int? _userIndex;
  int? get userIndex => _userIndex;
  set userIndex(value) {
    _userIndex = value;
    print("Current User Index $_userIndex");
  }

  String _deliveryName = " ";
  String get deliveryName => _deliveryName;
  set deliveryName(String val) {
    _deliveryName = val;
  }
// TextEditingController? deliveryMobileNo;

  String _deliveryMobileNo = " ";
  String get deliveryMobileNo => _deliveryMobileNo;
  set deliveryMobileNo(String val) {
    _deliveryName = val;
  }
// TextEditingController? deliveryPinCode;

  String _deliveryPinCode = " ";
  String get deliveryPinCode => _deliveryPinCode;
  set deliveryPinCode(String val) {
    _deliveryPinCode = val;
  }
// TextEditingController? deliveryState;

  String _deliveryState = " ";
  String get deliveryState => _deliveryState;
  set deliveryState(String val) {
    _deliveryState = val;
  }

// TextEditingController? deliveryCity;

  String _deliveryCity = " ";
  String get deliveryCity => _deliveryCity;
  set deliveryCity(String val) {
    _deliveryCity = val;
  }

// TextEditingController? deliveryStreet;
  String _deliveryStreet = " ";
  String get deliveryStreet => _deliveryStreet;
  set deliveryStreet(String val) {
    _deliveryStreet = val;
  }

// TextEditingController? deliveryArea;
  String _deliveryArea = " ";
  String get deliveryArea => _deliveryArea;
  set deliveryArea(String val) {
    _deliveryArea = val;
  }

  String _currentAddress = "Empty";
  String get currentAddress => _currentAddress;
  set currentAddress(String value) {
    _currentAddress = value;
    notifyListeners();
  }

  Position? _position;
  Position? get position => _position;
  set position(value) {
    _position = value;
    notifyListeners();
    // }
    //
    // bool _addressTypeHome = false;
    // bool get addressTypeHome => _addressTypeHome;
    // set addressTypeHome(bool value) {
    //   _addressTypeHome = value;
    //   notifyListeners();
    // }
    //
    // bool _addressTypeWork = false;
    // bool get addressTypeWork => _addressTypeWork;
    // set addressTypeWork(bool value) {
    //   _addressTypeWork = value;
    //   notifyListeners();
    // }
  }
}
