import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/geo_locator/geo_locator_model.dart';

class GeoLocatorControl extends ControllerMVC {
  factory GeoLocatorControl() => _this ??= GeoLocatorControl._();
  static GeoLocatorControl? _this;
  GeoLocatorControl._();
  GeoLocatorModel _geoModel = GeoLocatorModel();

  TextEditingController get deliveryName => _geoModel.deliveryName;
  TextEditingController get deliveryMobileNo => _geoModel.deliveryMobileNo;
  TextEditingController get deliveryPinCode => _geoModel.deliveryPinCode;
  TextEditingController get deliveryState => _geoModel.deliveryState;
  TextEditingController get deliveryCity => _geoModel.deliveryCity;
  TextEditingController get deliveryStreet => _geoModel.deliveryStreet;
  TextEditingController get deliveryArea => _geoModel.deliveryArea;

  //
  // get initAddressType => _geoModel.initAddressType();
  get addressTypeHome => _geoModel.addressTypeHome;
  set addressTypeHome(value) => _geoModel.addressTypeHome = value;
  get typeHomeFunc => _geoModel.typeHomeFunc();

  get addressTypeWork => _geoModel.addressTypeWork;
  set addressTypeWork(value) => _geoModel.addressTypeWork = value;

  get typeWorkFunc => _geoModel.typeWorkFunc();

  //

  Future getCurrentLocation(BuildContext context) async {
    var val = await _geoModel.getCurrentLocation(context);
    print("control:  $val");
    return val;
  }

  //
  Future getAddressFromPosition(context, Position position) async {
    var val = await _geoModel.getAddressFromPosition(context, position);
    print("control:  $val");
    return val;
  }

//
//
  get addressKey => _geoModel.addressKey;
  get editAddressKey => _geoModel.editAddressKey;

  Future addAddress(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      var mas = await _geoModel.addAddress();
      if (mas.contains('done')) {
        debugPrint('Address Add Successfully');
        Navigator.popUntil(context, ModalRoute.withName('/SavedAddressPage'));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  //
  // Future readAddress(context) async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  //   try {
  //     var mas = await _geoModel.readAddress();
  //     Navigator.pop(context);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future deleteAddress(DocumentSnapshot doc) async {
    await _geoModel.deleteProduct(doc);
  }

  Future editAddress(context, newValue, oldValue, key, doc) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      var mas = await _geoModel.editAddress(key, newValue, doc);
      Navigator.popUntil(context, ModalRoute.withName('/SavedAddressPage'));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
