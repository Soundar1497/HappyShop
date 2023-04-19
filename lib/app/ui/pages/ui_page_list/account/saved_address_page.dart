import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/ui/pages/ui_page_list/account/add_delivery_address.dart';

import '../../../../controllers/geo_locator_control/geo_locator_control.dart';
import '../../../../models/authentication_model.dart';

class SavedAddressPage extends StatefulWidget {
  const SavedAddressPage({Key? key}) : super(key: key);

  @override
  State<SavedAddressPage> createState() => _SavedAddressPageState();
}

class _SavedAddressPageState extends State<SavedAddressPage> {
  GeoLocatorControl _geoControl = GeoLocatorControl();
  AuthenticationModel _Auth = AuthenticationModel();

  int? currentUser;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  var userAddress;

  @override
  Widget build(BuildContext context) {
    print("21");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
        title: const Text("My Addresses"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Stack(
        children: [
          // Add New Addresses page

          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 55,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.5, .5),
                  spreadRadius: 1,
                  blurRadius: 1)
            ], color: Colors.white
                // color: Color.fromRGBO(250, 208, 214, 1.0),

                ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // splashColor: Colors.redAccent.withOpacity(.2),
                // highlightColor: Colors.orangeAccent.withOpacity(.1),
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, "/AddDeliveryAddress");
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                  child: const Text(
                    "+ Add a new address",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
          ),

          // List of pages
          StreamBuilder(
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

                  return Container(
                    // color: Colors.yellowAccent,
                    height: MediaQuery.of(context).size.height - 138.7,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 55),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          // count of address viewer

                          Container(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 4, left: 14),
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

                          ListView.builder(
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: data.size,
                              itemBuilder: (context, i) {
                                var list = data.docs[i];
                                return Center(
                                    child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 6,
                                    right: 6,
                                  ),
                                  // color: Colors.red,
                                  child: Card(
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
                                                  list['addressType'] != null
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
                                                  PopupMenuItem(
                                                      onTap: () {
                                                        _geoControl
                                                            .deleteAddress(
                                                                list);
                                                      },
                                                      child:
                                                          const Text('Delete')),
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
                                ));
                              }),
                        ],
                      ),
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

          //

          //

          //

          //

          //

          //

          //
          //
        ],
      ),
    );
  }
}
