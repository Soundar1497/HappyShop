import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/app/ui/pages/ui_page_list/cart/cart_product_list/qty_dropdown_button.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/Cart_Provider/cart_Provider.dart';
import '../../../../widgets/star_rating_icon/star_rating_icon.dart';

class CartProductList extends StatefulWidget {
  const CartProductList({Key? key}) : super(key: key);
  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
  num totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // cart Provider
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.cartTotalPrice.clear();

    double totalPrice = 0;

    for (var element in cartProvider.cartList) {
      var val2 = element[4].toString().substring(1).split(",");
      var sp = double.parse(val2[0] + val2[1]);

      cartProvider.cartTotalPrice = sp;
      print(cartProvider.cartTotalPrice);
    }

    for (var element in cartProvider.cartTotalPrice) {
      totalPrice = totalPrice + element;
    }
    print('totalPrice : $totalPrice');

    // cart list variable

    var cartList = cartProvider.cartList;

    print("cartList.length : ${cartProvider.cartList.length}");
    // for (var element in cartProvider.cartList) {
    //   if (element[0] == "realme 10 Pro 5G (6GB RAM, 128GB, Hyperspace)") {
    //     print(
    //         "cartList specific element index : ${cartProvider.cartList.indexOf(element)}");
    //     break;
    //   }
    // }

    cartProvider.cartList.forEach((element) {
      print(
          "cartList for each element \n element[${cartProvider.cartList.indexOf(element)}] : ${element[0]}");
    });

    return Expanded(
        child: Container(
      margin: const EdgeInsets.only(top: 8),
      // color: Colors.red[100],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: cartList.length,
                itemBuilder: (context, i) {
                  // initialize the variable

                  String title = cartList[i][0];
                  String imgUrl = cartList[i][1][0];
                  String shipping = cartList[i][8];
                  double rating = cartList[i][2];
                  int review = cartList[i][3];
                  String sellingPrice = cartList[i][4];
                  String originalPrice = cartList[i][5];
                  String savingPrice = cartList[i][6];

                  print("imgurl : $imgUrl");

                  //
                  return Container(
                    margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    // height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(.5, .5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 4),
                                  child: Container(
                                    width: 80,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(-.5, .5),
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ]),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      child: Image.network(
                                        imgUrl,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                                const QtyDropDownButton(),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 6, right: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${title.toString().capitalizeFirst}",
                                      style: const TextStyle(fontSize: 18),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        children: [
                                          StarRatingIcon(
                                            ratingValue:
                                                rating <= 1 && rating > 0
                                                    ? rating
                                                    : rating > 1
                                                        ? 1
                                                        : 0,
                                            size: 16,
                                          ),
                                          StarRatingIcon(
                                            ratingValue:
                                                rating <= 2 && rating > 1
                                                    ? rating - 1
                                                    : rating > 2
                                                        ? 1
                                                        : 0,
                                            size: 16,
                                          ),
                                          StarRatingIcon(
                                            ratingValue:
                                                rating <= 3 && rating > 2
                                                    ? rating - 2
                                                    : rating > 3
                                                        ? 1
                                                        : 0,
                                            size: 16,
                                          ),
                                          StarRatingIcon(
                                            ratingValue:
                                                rating <= 4 && rating > 3
                                                    ? rating - 3
                                                    : rating > 4
                                                        ? 1
                                                        : 0,
                                            size: 16,
                                          ),
                                          StarRatingIcon(
                                            ratingValue:
                                                rating <= 5 && rating > 4
                                                    ? rating - 4
                                                    : rating > 5
                                                        ? 1
                                                        : 0,
                                            size: 16,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text('(${review})'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 14,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // selling price

                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 6),
                                            child: Text(
                                              sellingPrice,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),

                                          // original price

                                          Padding(
                                            padding: EdgeInsets.only(right: 6),
                                            child: Text(
                                              originalPrice,
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Text(
                                        'You saved ₹$savingPrice',
                                        style: const TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 8),
                          child: Text(
                            shipping,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Row(
                            children: [
                              //remove

                              Expanded(
                                child: Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right:
                                              BorderSide(color: Colors.black12),
                                          top: BorderSide(
                                            color: Colors.black12,
                                          ))),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        var index = removeList(cartList, title);

                                        setState(() {
                                          cartProvider.cartList.removeAt(index);
                                          cartProvider.cartTotalPrice
                                              .removeAt(index);
                                          cartProvider.cartLength =
                                              cartProvider.cartList.length;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.delete_outline,
                                            color: Colors.black45,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            'Remove',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right:
                                              BorderSide(color: Colors.black12),
                                          top: BorderSide(
                                            color: Colors.black12,
                                          ))),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.save,
                                            color: Colors.black45,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            'Save for later',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          right:
                                              BorderSide(color: Colors.black12),
                                          top: BorderSide(
                                            color: Colors.black12,
                                          ))),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons
                                                .shopping_cart_checkout_outlined,
                                            color: Colors.black45,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            'Buy this now',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.1),
                    offset: Offset(-1, 0),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ]),
            width: double.infinity,
            height: 55,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          totalPrice != 0
                              ? totalPrice.toStringAsFixed(2)
                              : 'No product selected',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'View price details',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                      if (state.contains(MaterialState.pressed)) {
                        return Colors.orange[300];
                      }
                      return Colors.orange[400];
                    })),
                    onPressed: () {},
                    child: const Text(
                      'Place Order',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ))
                ],
              ),
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1.3,
          )
        ],
      ),
    ));
  }
}

//
//
//

removeList(List cartList, String title) {
  int? index;
  print(title);
  for (var element in cartList) {
    print(element[0]);
    if (element[0] == title) {
      index = cartList.indexOf(element);
      print("cartList specific element index : ${cartList.indexOf(element)}");
      break;
    }
  }
  return index;
}

//
//
