import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../provider/Cart_Provider/cart_Provider.dart';
import '../../../widgets/carousel_indicator.dart';
import '../../../widgets/star_rating_icon/star_rating_icon.dart';

class MobileListDetail extends StatefulWidget {
  MobileListDetail(List<dynamic> this.arguments, {Key? key}) : super(key: key);
  List<dynamic>? arguments;

  // String productTitle
  // List productPhotos;
  // double rating;
  // String review;
  // String sellingPrice;
  // String originalPrice;
  // String savingPrice;

  @override
  State<MobileListDetail> createState() => _MobileListDetailState();
}

class _MobileListDetailState extends State<MobileListDetail> {
  CarouselController _controller = CarouselController();

  int active = 0;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    // widget.productTitle,
    // widget.productPhotos,
    // rating,
    // review,
    // sellingPrice,
    // originalPrice,
    // savingPrice

    String title = widget.arguments![0];
    List imgUrl = widget.arguments![1];
    double rating = widget.arguments![2];
    int review = widget.arguments![3];
    String sellingPrice = widget.arguments![4];
    String originalPrice = widget.arguments![5];
    String savingPrice = widget.arguments![6];
    String description = widget.arguments![7];
    String shipping = widget.arguments![8];
    String storeName = widget.arguments![9];
    Map attributes = widget.arguments![10];

    if (mounted) {
      return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          setState(() {
            Navigator.pushReplacementNamed(context, '/MobileListDetail',
                arguments: [
                  title,
                  imgUrl,
                  rating,
                  review,
                  sellingPrice,
                  originalPrice,
                  savingPrice,
                  description,
                  shipping,
                  storeName,
                  attributes,
                ]);
          });
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
            title: Text(title),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined)),
            ],
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Column(
                children: [
                  // carousel image

                  Stack(children: [
                    CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                            viewportFraction: .6,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            height: 250,
                            autoPlayCurve: Curves.easeInOutQuad,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            enlargeCenterPage: true,
                            autoPlay: false,
                            onPageChanged: (i, he) {
                              setState(() {
                                active = i;
                              });
                            }),
                        items: imgUrl.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width:
                                      MediaQuery.of(context).size.width - 165,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(.5, .5),
                                            blurRadius: 2,
                                            spreadRadius: 1)
                                      ]),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    child: GestureDetector(
                                        child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                      child:
                                          Image.network(i, fit: BoxFit.contain),
                                    )),
                                  ));
                            },
                          );
                        }).toList()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: 15,
                          width: 20 * imgUrl.length.toDouble(),
                          margin: const EdgeInsets.only(
                              left: 4, right: 5, top: 245),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black26,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: carouselIndicator(imgUrl.length, active),
                          ),
                        ),
                      ),
                    ),
                  ]),

                  //Scrollable product detail

                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Store and rating and review detail

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 185,
                                  child: Text(
                                    "Visit the $storeName",
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(246, 110, 133, 1.0),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),

                                // Rating Icon

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // rating in text
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        "$rating",
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ),

                                    // 5 star icon

                                    StarRatingIcon(
                                      ratingValue: rating <= 1 && rating > 0
                                          ? rating
                                          : rating > 1
                                              ? 1
                                              : 0,
                                      size: 15,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating <= 2 && rating > 1
                                          ? rating - 1
                                          : rating > 2
                                              ? 1
                                              : 0,
                                      size: 15,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating <= 3 && rating > 2
                                          ? rating - 2
                                          : rating > 3
                                              ? 1
                                              : 0,
                                      size: 15,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating <= 4 && rating > 3
                                          ? rating - 3
                                          : rating > 4
                                              ? 1
                                              : 0,
                                      size: 15,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating <= 5 && rating > 4
                                          ? rating - 4
                                          : rating > 5
                                              ? 1
                                              : 0,
                                      size: 15,
                                    ),

                                    // product review

                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        "(${review}review)",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            //Product Name

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                title.replaceFirst(
                                  title[0],
                                  title[0].toUpperCase(),
                                ),
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            // delivery detail

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                shipping,
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            // Divider Line

                            const Divider(
                              thickness: 2,
                            ),

                            //Selling Price

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                sellingPrice.toString(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ),

                            //origimal price

                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: [
                                  Text(
                                    "M.R.P.: ",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    " $originalPrice",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),

                            //EMI And Offers

                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: RichText(
                                softWrap: true,
                                textScaleFactor: 1,
                                text: TextSpan(
                                    text: 'EMI',
                                    style: const TextStyle(
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text:
                                              ' from \u{20B9}908. No Cost EMI available.',
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                      const TextSpan(
                                          text: ' EMI options',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                      TextSpan(
                                          text: ' Inclusive of all taxes',
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 4, left: 12, right: 40),
                              child: RichText(
                                softWrap: true,
                                textScaleFactor: 1,
                                text: TextSpan(
                                    text:
                                        'Buy now, pay in EMI up to 12 month with any credit Card Later',
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    children: const [
                                      TextSpan(
                                          text:
                                              '\nActivate & get Welcome reward of',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  211, 30, 61, 1.0),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: ' \u{20B9}600',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                      TextSpan(
                                          text: '>',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  211, 30, 61, 1.0),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ]),
                              ),
                            ),

                            // Divider Line

                            const Divider(
                              height: 20,
                              thickness: 2,
                            ),

                            // Highlights

                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Text(
                                "Highlights",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),

                            // Description

                            Text(
                              "${" " * 6}$description",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                height: 1.3,
                                fontSize: 18,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),

                            //size Space

                            const SizedBox(
                              height: 8,
                            ),

                            // Other Details text
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              child: Text(
                                "Other Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),

                            // Other Details text table

                            Center(
                              child: createTable(attributes),
                            ),

                            //End Space for bottom Container

                            Container(
                              height: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(.1),
                            offset: Offset(-1, 0),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (cartProvider.cartList.isNotEmpty) {
                                  bool? isNull;
                                  for (var e in cartProvider.cartList) {
                                    print(
                                        "e[0]: ${e[0]} \n argument : ${widget.arguments![0]}");
                                    if (e[0] == widget.arguments![0]) {
                                      isNull = false;
                                      print("isnull = $isNull");
                                      break;
                                    } else {
                                      isNull = true;
                                      print("isnull = $isNull");
                                    }
                                  }

                                  //

                                  if (isNull!) {
                                    setState(() {
                                      cartProvider.cartList = widget.arguments;
                                      print(
                                          "list is add ${cartProvider.cartList.length + 1} th element : ${cartProvider.cartList}");
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration:
                                                Duration(milliseconds: 400),
                                            content: Text(
                                                "Product Added to the Cart Successfully")));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration:
                                                Duration(milliseconds: 600),
                                            content: Text(
                                                "Product is already added to cart")));
                                  }
                                } else {
                                  setState(() {
                                    cartProvider.cartList = widget.arguments;
                                    print(
                                        "list is empty and add first element : ${cartProvider.cartList}");
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(milliseconds: 600),
                                          content: Text(
                                              "Product Added to the Cart Successfully")));
                                }
                              },
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20)),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20)),
                                ),
                                child: const Text(
                                  'Add To Cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          width: 0,
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20)),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20)),
                                  ),
                                  child: const Text(
                                    'Buy Now',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

Widget createTable(Map data) {
  List<TableRow> rows = [];
  var i = 0;
  data.forEach((k, v) {
    rows.add(TableRow(
        decoration: i % 2 != 0
            ? const BoxDecoration(color: Color.fromRGBO(245, 147, 163, .3))
            : const BoxDecoration(color: Color.fromRGBO(245, 147, 163, .05)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$k",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$v",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                )),
          ),
        ]));
    i++;
  });
  return Table(columnWidths: const {
    0: FractionColumnWidth(.4),
    1: FractionColumnWidth(.5),
  }, children: rows);
}

class CartStorage {
  List cartData = [];

  Future getData() async {
    var perf = await SharedPreferences.getInstance();
    perf.getStringList('argument');
  }

  Future setData(arg) async {
    var perf = await SharedPreferences.getInstance();
    perf.setStringList('argument', arg);
  }
}
