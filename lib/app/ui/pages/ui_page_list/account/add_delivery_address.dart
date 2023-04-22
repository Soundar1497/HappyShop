import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/carousel_control.dart';
import '../../../../controllers/geo_locator_control/geo_locator_control.dart';
import '../../../widgets/add_delivery_address/address_TextField.dart';

class AddDeliveryAddress extends StatefulWidget {
  AddDeliveryAddress({
    Key? key,
    this.doc,
    this.argument,
  }) : super(key: key);
  List<dynamic>? argument;
  final QueryDocumentSnapshot<Object?>? doc;
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  final GeoLocatorControl _geoLocatorControl = GeoLocatorControl();

  Future findPinCode() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      debugPrint('state 11');

      Position location = await _geoLocatorControl.getCurrentLocation(context);

      print(location);
      debugPrint('state 22');

      if (location != null) {
        debugPrint('state 33');

        var currentLocation = await _geoLocatorControl.getAddressFromPosition(
            context, location as Position);
        debugPrint('state 44');

        if (currentLocation.runtimeType == List) {
          debugPrint('state 55');

          setState(() {
            _geoLocatorControl.deliveryPinCode.text = currentLocation[0];
            _geoLocatorControl.deliveryState.text = currentLocation[1];
            _geoLocatorControl.deliveryCity.text = currentLocation[2];
            Navigator.pop(context);
          });
        }
      }

      return "done";
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  var _savedName;
  var _savedMobile;
  var _savedPincode;
  var _addressType;
  var _savedState;
  var _savedCity;
  var _savedStreet;
  var _savedArea;
  bool _home = false;
  bool _work = false;

  void editorValidation(doc, bool popBool, provider) {
    if (_geoLocatorControl.deliveryName.text == _savedName &&
        _geoLocatorControl.deliveryMobileNo.text == _savedMobile &&
        _geoLocatorControl.deliveryPinCode.text == _savedPincode &&
        _geoLocatorControl.deliveryState.text == _savedState &&
        _geoLocatorControl.deliveryCity.text == _savedCity &&
        _geoLocatorControl.deliveryStreet.text == _savedStreet &&
        _geoLocatorControl.deliveryArea.text == _savedArea &&
        _geoLocatorControl.addressTypeHome == _home &&
        _geoLocatorControl.addressTypeWork == _work) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 400),
          content: Text("Address Not Changed")));
    } else {
      check(_geoLocatorControl.deliveryName.text, _savedName, 'deli_name', doc,
          popBool, provider);
      check(_geoLocatorControl.deliveryMobileNo.text, _savedName, 'deli_mobile',
          doc, popBool, provider);
      check(_geoLocatorControl.deliveryPinCode.text, _savedName, 'deli_pincode',
          doc, popBool, provider);
      check(_geoLocatorControl.deliveryState.text, _savedName, 'deli_state',
          doc, popBool, provider);
      check(_geoLocatorControl.deliveryCity.text, _savedName, 'deli_city', doc,
          popBool, provider);
      check(_geoLocatorControl.deliveryStreet.text, _savedName, 'deli_street',
          doc, popBool, provider);
      check(_geoLocatorControl.deliveryArea.text, _savedName, 'deli_area', doc,
          popBool, provider);

      String? addressType;
      if (_geoLocatorControl.addressTypeWork == false &&
          _geoLocatorControl.addressTypeHome == false) {
        addressType = "null";
      } else if (_geoLocatorControl.addressTypeHome == true) {
        addressType = "home";
      } else {
        addressType = "work";
      }
      check(addressType, _addressType, 'addressType', doc, popBool, provider);
    }
  }

  void check(newValue, savedValue, key, doc, bool popBool, provider) {
    if (newValue != savedValue) {
      _geoLocatorControl.editAddress(
          context, newValue, savedValue, key, doc, popBool, provider);
    }
  }

  Future editAddress(doc) async {
    _savedName = _geoLocatorControl.deliveryName.text = doc['deli_name'];
    _savedMobile =
        _geoLocatorControl.deliveryMobileNo.text = doc['deli_mobile'];
    _savedPincode =
        _geoLocatorControl.deliveryPinCode.text = doc['deli_pincode'];
    _savedState = _geoLocatorControl.deliveryState.text = doc['deli_state'];
    _savedCity = _geoLocatorControl.deliveryCity.text = doc['deli_city'];
    _savedStreet = _geoLocatorControl.deliveryStreet.text = doc['deli_street'];
    _savedArea = _geoLocatorControl.deliveryArea.text = doc['deli_area'];
    _addressType = doc['addressType'];
    print('$_savedName, $_savedPincode');
    if (doc['addressType'] != 'null') {
      if (doc['addressType'] == 'home') {
        _home = true;
        setState(() {
          _geoLocatorControl.addressTypeHome = true;
          _geoLocatorControl.addressTypeWork = false;
        });
      } else {
        setState(() {
          _geoLocatorControl.addressTypeHome = false;
          _geoLocatorControl.addressTypeWork = true;
        });
        _work = true;
      }
    } else {
      setState(() {
        _geoLocatorControl.addressTypeHome = false;
        _geoLocatorControl.addressTypeWork = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      editAddress(widget.doc);
    } else {
      _geoLocatorControl.deliveryName.text = "";
      _geoLocatorControl.deliveryMobileNo.text = "";
      _geoLocatorControl.deliveryPinCode.text = "";
      _geoLocatorControl.deliveryState.text = "";
      _geoLocatorControl.deliveryCity.text = "";
      _geoLocatorControl.deliveryStreet.text = "";
      _geoLocatorControl.deliveryArea.text = "";
      _geoLocatorControl.addressTypeHome = false;
      _geoLocatorControl.addressTypeWork = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarouselListener>(context);

    bool popBool = widget.argument![0];

    print('popBool : $popBool');

    var key = widget.doc != null
        ? _geoLocatorControl.addressKey
        : _geoLocatorControl.editAddressKey;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
        title: const Text("Add delivery address"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 4, bottom: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          child: Column(
            children: [
              Form(
                  key: key,
                  child: Column(
                    children: [
                      //Delivery Name
                      AddressTextField(
                        controller: _geoLocatorControl.deliveryName,
                        label: 'Full Name (Required) *',
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "* Please Enter Your Name";
                          }
                          return null;
                        },
                      ),
                      //Delivery mobile
                      AddressTextField(
                        controller: _geoLocatorControl.deliveryMobileNo,
                        label: 'Phone number (Required) *',
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "* Mobile Number required";
                          } else if (data.length != 10) {
                            return "* Incorrect Mobile Number";
                          }
                          return null;
                        },
                      ),
                      //Delivery pincode
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //delivery pincode text
                          Flexible(
                            child: AddressTextField(
                              width: 180,
                              controller: _geoLocatorControl.deliveryPinCode,
                              label: 'Pincode (Required) *',
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "* Pincode required";
                                } else if (data.length != 6) {
                                  return "* Pincode is not matching";
                                }
                                return null;
                              },
                            ),
                          ),
                          //Sized  box
                          const SizedBox(
                            width: 10,
                          ),

                          // find pincode button

                          Flexible(
                            child: Container(
                              height: 40,
                              margin: const EdgeInsets.only(top: 29),
                              child: ElevatedButton(
                                  onPressed: () {
                                    findPinCode();
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.my_location_rounded,
                                        size: 18,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("Use my Location"),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),

                      // state and city name
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: AddressTextField(
                              controller: _geoLocatorControl.deliveryState,
                              label: 'State (Required) *',
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "* please provide necessary details";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: AddressTextField(
                              icon: const Icon(
                                Icons.search_rounded,
                                size: 24,
                              ),
                              controller: _geoLocatorControl.deliveryCity,
                              label: 'City (Required) *',
                              validator: (data) {
                                if (data!.isEmpty || data == "") {
                                  return "* please provide necessary details";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),

                      // street name
                      AddressTextField(
                        controller: _geoLocatorControl.deliveryStreet,
                        label: 'House No., Building Name (Required) *',
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "* please provide necessary details";
                          }
                          return null;
                        },
                      ),
                      //area name
                      AddressTextField(
                        icon: const Icon(
                          Icons.search_rounded,
                          size: 24,
                        ),
                        controller: _geoLocatorControl.deliveryArea,
                        label: 'Road name, Area, Colony (Required) *',
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "* please provide necessary details";
                          }
                          return null;
                        },
                      ),

                      // type of address

                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 16, bottom: 10),
                          child: const Text("Type of Address")),
                      //home and work
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 38,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (_geoLocatorControl.addressTypeHome)
                                        ? Colors.blueAccent
                                        : Colors.black12.withOpacity(.2),
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignInside),
                                color: _geoLocatorControl.addressTypeHome
                                    ? Colors.blueAccent.withOpacity(.1)
                                    : Colors.black12.withOpacity(.05),
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                )),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                ),
                                onTap: () {
                                  setState(() {
                                    _geoLocatorControl.typeHomeFunc;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.home,
                                        size: 20,
                                        color: Colors.black.withOpacity(.6),
                                        weight: 10,
                                      ),
                                    ),
                                    const Text(
                                      "Home",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 90,
                            height: 38,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: _geoLocatorControl.addressTypeWork
                                        ? Colors.blueAccent
                                        : Colors.black12.withOpacity(.2),
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignInside),
                                color: _geoLocatorControl.addressTypeWork
                                    ? Colors.blueAccent.withOpacity(.1)
                                    : Colors.black12.withOpacity(.05),
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                )),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                ),
                                onTap: () {
                                  setState(() {
                                    _geoLocatorControl.typeWorkFunc;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.factory,
                                        size: 20,
                                        color: Colors.black.withOpacity(.6),
                                        weight: 10,
                                      ),
                                    ),
                                    const Text(
                                      "Work",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 16),
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        if (widget.doc != null) {
                          print("doc present");
                          editorValidation(widget.doc, popBool, provider);
                        } else {
                          _geoLocatorControl.addAddress(
                              context, popBool, provider);
                        }
                      }
                      // _geoLocatorControl.addAddress(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                        if (state.contains(MaterialState.pressed)) {
                          return Colors.deepOrangeAccent;
                        }
                        return Colors.deepOrangeAccent;
                      }),
                    ),
                    child: const Text(
                      "Save Address",
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
