import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/authentication_model.dart';
import '../../../../../provider/Cart_Provider/cart_Provider.dart';
import '../../account/add_delivery_address.dart';

class AddressOptionList extends StatefulWidget {
  const AddressOptionList({Key? key}) : super(key: key);

  @override
  State<AddressOptionList> createState() => _AddressOptionListState();
}

class _AddressOptionListState extends State<AddressOptionList> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  AuthenticationModel _Auth = AuthenticationModel();
  @override
  Widget build(BuildContext context) {
    var addressIndex = Provider.of<CartProvider>(context);
    return Container(
      height: 385,
      child: StreamBuilder(
          stream: fireStore
              .collection('User')
              .doc('user_${_Auth.userIndex}')
              .collection('deliveryAddress')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator()));
            } else if (snapshot.hasData) {
              var data = snapshot.data;
              print(data!.size);

              return SizedBox(
                // color: Colors.yellowAccent,
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    // count of address viewer

                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 4, left: 14),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Text(
                        "${data.size} SAVED ADDRESSES",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87.withOpacity(.6)),
                      ),
                    ),
                    // Divider
                    const Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    //list view builder for addresses

                    Container(
                      height: 270,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (context, i) {
                            var list = data.docs[i];
                            return Center(
                                child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(.5, .5),
                                        color: Colors.black12,
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ]),

                              // color: Colors.red,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  onTap: () {
                                    print("$i : $addressIndex");

                                    setState(() {
                                      addressIndex.addressIndex = i;
                                      Navigator.pop(context);
                                    });
                                    print("$i : $addressIndex");
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                    // decoration: BoxDecoration(
                                    //     color: Colors.white,
                                    //     borderRadius:
                                    //         BorderRadius.all(Radius.circular(4)),
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //           offset: Offset(.5, .5),
                                    //           color: Colors.black12,
                                    //           blurRadius: 1,
                                    //           spreadRadius: 1)
                                    //     ]),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 300,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12),
                                                    child: Container(
                                                      child: Text(
                                                        list['deli_name']
                                                                    .toString()
                                                                    .length >
                                                                20
                                                            ? '${list['deli_name'].toString().substring(0, 20)}...'
                                                            : list['deli_name'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black87
                                                                .withOpacity(
                                                                    .6),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  list['addressType'] != "null"
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Container(
                                                              width: 40,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 2,
                                                                  horizontal:
                                                                      4),
                                                              decoration: BoxDecoration(
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          20)),
                                                                  color: Colors
                                                                          .grey[
                                                                      300]),
                                                              child: Text(
                                                                list['addressType']
                                                                    .toString()
                                                                    .toUpperCase(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                              )),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Container(
                                                            width: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 2,
                                                                    horizontal:
                                                                        4),
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .transparent),
                                                          )),
                                                ],
                                              ),
                                            ),
                                            PopupMenuButton(
                                              onSelected: (val) {
                                                if (val == 0) {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddDeliveryAddress(
                                                                doc: list,
                                                                argument: const [
                                                                  false
                                                                ],
                                                              )));
                                                }
                                              },
                                              padding: const EdgeInsets.all(0),
                                              offset: const Offset(0, 38),
                                              icon: const Icon(Icons.more_vert),
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  PopupMenuItem(
                                                      value: 0,
                                                      onTap: () {
                                                        print(list);
                                                      },
                                                      child:
                                                          const Text('Edit')),
                                                  // PopupMenuItem(
                                                  //     onTap: () {
                                                  //       _geoControl
                                                  //           .deleteAddress(
                                                  //           list);
                                                  //     },
                                                  //     child:
                                                  //     const Text('Delete')),
                                                ];
                                              },
                                            )
                                          ],
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.only(
                                                left: 12, right: 60),
                                            child: Text(
                                              '${list['deli_street']}, ${list['deli_area']}, ${list['deli_city']}',
                                            )),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.only(
                                              top: 4, left: 12, right: 60),
                                          child: Text(
                                              '${list['deli_state']} - ${list['deli_pincode']}'),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 5,
                                              left: 12,
                                            ),
                                            child: Text(
                                              list['deli_mobile'],
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                          }),
                    ),
                    //
                    //
                    //
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 20, right: 20),
                      width: double.infinity,
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/AddDeliveryAddress",
                                arguments: [false]);
                          },
                          child: const Text(
                            'Add New Address',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Container(
                  child: Text("No Address Saved"),
                ),
              );
            }
          }),
    );
  }
}
