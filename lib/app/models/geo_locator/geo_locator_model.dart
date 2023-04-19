import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../authentication_model.dart';

class GeoLocatorModel {
  TextEditingController deliveryName = TextEditingController();
  TextEditingController deliveryMobileNo = TextEditingController();
  TextEditingController deliveryPinCode = TextEditingController();
  TextEditingController deliveryState = TextEditingController();
  TextEditingController deliveryCity = TextEditingController();
  TextEditingController deliveryStreet = TextEditingController();
  TextEditingController deliveryArea = TextEditingController();

  GlobalKey addressKey = GlobalKey();
  GlobalKey editAddressKey = GlobalKey();

  //

  bool _addressTypeHome = false;
  bool get addressTypeHome => _addressTypeHome;
  set addressTypeHome(bool value) {
    _addressTypeHome = value;
  }

  typeHomeFunc() {
    addressTypeHome = !addressTypeHome;
    if (addressTypeHome == true) {
      addressTypeWork = false;
    }
  }

  bool _addressTypeWork = false;
  bool get addressTypeWork => _addressTypeWork;
  set addressTypeWork(bool value) {
    _addressTypeWork = value;
  }

  typeWorkFunc() {
    addressTypeWork = !addressTypeWork;
    if (addressTypeWork == true) {
      addressTypeHome = false;
    }
  }

  //
  // initAddressType() {
  //   addressTypeHome = false;
  //
  //   addressTypeWork = false;
  // }

  //
  //

  //
  // Location finder

  Future<bool> locationPermission(BuildContext context) async {
    bool? serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Location Service Disabled. Please Enable the service")));
      Navigator.pop(context);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Location Permission denied"),
        ));
        Navigator.pop(context);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Location permissions are permanently denied, we cannot request permissions.")));
      Navigator.pop(context);
      return false;
    }
    debugPrint('state 1');
    return true;
  }

  Future getCurrentLocation(BuildContext context) async {
    debugPrint('state 1');

    final hasPermission = await locationPermission(context);
    debugPrint(hasPermission.toString());

    if (!hasPermission) return null;

    var val = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .timeout(const Duration(seconds: 20))
        .then((Position currentPosition) {
      return currentPosition;
    }).catchError((e) {
      debugPrint(e.toString());
    });
    debugPrint("model : $val");
    return val;
  }

  Future getAddressFromPosition(BuildContext context, Position position) async {
    List? _currentAddress = [];

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placeMark) {
      Placemark place = placeMark[0];
      _currentAddress.insert(0, "${place.postalCode}");
      _currentAddress.insert(1, "${place.administrativeArea}");
      _currentAddress.insert(2, "${place.locality}");
      print(" At End current Address : ${_currentAddress}");
    }).catchError((e) {
      debugPrint(e);
    });
    return _currentAddress;
  }

  //
  //

  //
  // add address form data handling

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Future<int> verifyUser() async {
  //   var currentUser = firebaseAuth.currentUser!.email;
  //   var dataBase = fireStore.collection('User');
  //   var dataBaseID = await fireStore.collection('User').get();
  //   int i = 0;
  //   for (i; i < dataBaseID.size; i++) {
  //     var dbDoc = await dataBase.doc('user_${i}').get();
  //     var dbUser = dbDoc.data();
  //     if (dbUser!['email'] == currentUser) {
  //       break;
  //     }
  //   }
  //   print(i);
  //   return i;
  // }
  AuthenticationModel _AuthenticationModel = AuthenticationModel();

  Future verifyDoc(String key, String savedValue) async {
    int? userIndex = _AuthenticationModel.userIndex;
    var doc = await fireStore
        .collection('User')
        .doc('user_$userIndex')
        .collection('deliveryAddress');
    var docID = await fireStore
        .collection('User')
        .doc('user_$userIndex')
        .collection('deliveryAddress')
        .get();
    int docIndex = docID.size;
    int i = 0;
    for (i; i < docIndex; i++) {
      var value = await doc.doc('address_$i').get();
      var address = value.data();
      if (address![key] == savedValue) {
        break;
      }
    }
    return i;
  }

  Future addAddress() async {
    int? userIndex = _AuthenticationModel.userIndex;

    String? addressType;
    if (addressTypeWork == false && addressTypeHome == false) {
      addressType = "null";
    } else if (addressTypeHome == true) {
      addressType = "home";
    } else {
      addressType = "work";
    }
    await fireStore
        .collection('User')
        .doc('user_$userIndex')
        .collection('deliveryAddress')
        .add({
      'deli_name': deliveryName.text,
      'deli_mobile': deliveryMobileNo.text,
      'deli_pincode': deliveryPinCode.text,
      'deli_state': deliveryState.text,
      'deli_city': deliveryCity.text,
      'deli_street': deliveryStreet.text,
      'deli_area': deliveryArea.text,
      'addressType': addressType,
    });
    return "done";
  }

  // Future readAddress() async {
  //   int? userIndex = _AuthenticationModel.userIndex;
  //
  //   // int dataIndex = await verifyDoc(key, savedValue);
  //   return await fireStore
  //       .collection('User')
  //       .doc('user_$userIndex')
  //       .collection('deliveryAddress')
  //       .get();
  // }

  Future editAddress(String key, String newValue, DocumentSnapshot doc) async {
    int? userIndex = _AuthenticationModel.userIndex;

    // int dataIndex = await verifyDoc(key, savedValue);
    await fireStore
        .collection('User')
        .doc('user_$userIndex')
        .collection('deliveryAddress')
        .doc(doc.id)
        .update({
      key: newValue,
    });
  }

  Future<void> deleteProduct(DocumentSnapshot doc) async {
    int? userIndex = _AuthenticationModel.userIndex;

    await fireStore
        .collection('User')
        .doc('user_$userIndex')
        .collection('deliveryAddress')
        .doc(doc.id)
        .delete();
  }
}
