import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/provider/Cart_Provider/cart_Provider.dart';
import 'package:provider/provider.dart';

import '../../../../../models/authentication_model.dart';
import 'addressOptionList.dart';

class AddressSelection extends StatefulWidget {
  const AddressSelection({Key? key}) : super(key: key);

  @override
  State<AddressSelection> createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  AuthenticationModel _Auth = AuthenticationModel();

  @override
  Widget build(BuildContext context) {
    var addressIndex = Provider.of<CartProvider>(context);
    print("At start addressIndex  : ${addressIndex.addressIndex} ");
    return StreamBuilder(
        stream: fireStore
            .collection('User')
            .doc('user_${_Auth.userIndex}')
            .collection('deliveryAddress')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Container(
                    height: 30, width: 30, child: CircularProgressIndicator()));
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            print("data i null : ${data!.docs.isEmpty}");

            if (data.docs.isEmpty != true) {
              var i = 0;
              print("data snapshot size : ${data.size}");
              var listAddress = data.docs[addressIndex.addressIndex];
              //
              //

              var deliveryName = listAddress['deli_name'].toString().length > 8
                  ? "${(listAddress['deli_name'].toString()).substring(0, 8)}..."
                  : listAddress['deli_name'].toString();
              //
              var deliveryPincode = listAddress['deli_pincode'].toString();
              //
              var addressType = listAddress['addressType'].toString();
              //
              var bottomAddress =
                  "${listAddress['deli_street']}, ${listAddress['deli_area']}.";

              //
              //
              return Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.5, .5),
                      spreadRadius: 1,
                      blurRadius: 1)
                ], color: Colors.white
                    // color: Color.fromRGBO(250, 208, 214, 1.0),

                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Deliver to: ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text("$deliveryName, "),
                            Text(deliveryPincode),
                            addressType != "null"
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                        width: 40,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            color: Colors.grey[300]),
                                        child: Text(
                                          addressType.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 10),
                                        )),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      width: 40,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.transparent),
                                    )),
                          ],
                        ),
                        Container(
                          width: 250,
                          padding: EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                              // color: Colors.red,
                              ),
                          child: Text(
                            bottomAddress,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("object 1");
                          addressOption(context);
                          print("object 2");
                        },
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.5, .5),
                      spreadRadius: 1,
                      blurRadius: 1)
                ], color: Colors.white
                    // color: Color.fromRGBO(250, 208, 214, 1.0),

                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        child: const Text(
                          "No Address Saved",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/AddDeliveryAddress",
                              arguments: [false]);
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: Container(
                child: Text("No Address Saved"),
              ),
            );
          }
        });
  }
}

addressOption(BuildContext context) {
  print("object 2");

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  AuthenticationModel _Auth = AuthenticationModel();
  print("object 3");

  return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const AddressOptionList();
      });
}
