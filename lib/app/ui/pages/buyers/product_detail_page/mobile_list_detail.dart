import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    String review = widget.arguments![3];
    String sellingPrice = widget.arguments![4];
    String originalPrice = widget.arguments![5];
    String savingPrice = widget.arguments![6];
    String description = widget.arguments![7];
    Map attributes = widget.arguments![8];
    String shipping = widget.arguments![9];
    String storeName = widget.arguments![10];

    // print(widget.arguments![0]);
    // print(widget.arguments![1]);
    // print(widget.arguments![2]);
    // print(widget.arguments![3]);
    // print(widget.arguments![4]);
    // print(widget.arguments![5]);
    // print(widget.arguments![6]);
    // print(widget.arguments![7]);
    // print(widget.arguments![8]);
    // print(widget.arguments![9]);

    print(
        "-------------------------------------------------------------------");

    imgUrl.forEach((e) {
      print("-------- $e ----------------");
    });

    if (mounted) {
      return RefreshIndicator(
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
                  attributes,
                  shipping,
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
                            viewportFraction: .8,
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
                                  width: MediaQuery.of(context).size.width - 50,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(.5, .5),
                                            blurRadius: 1,
                                            spreadRadius: 1)
                                      ]),
                                  child: Material(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: GestureDetector(
                                        child: Image.network(i,
                                            fit: BoxFit.contain)),
                                  ));
                            },
                          );
                        }).toList()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height: 15,
                          width: 22 * imgUrl.length.toDouble(),
                          margin: const EdgeInsets.only(
                              left: 4, right: 5, top: 245),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black26,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                Text(
                                  "Visit the $storeName",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(246, 110, 133, 1.0),
                                    fontSize: 14,
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
                                      ratingValue: rating < 1 ? rating : 1,
                                      size: 12,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating < 2 ? rating - 1 : 1,
                                      size: 12,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating < 3 ? rating - 2 : 1,
                                      size: 12,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating < 4 ? rating - 3 : 1,
                                      size: 12,
                                    ),
                                    StarRatingIcon(
                                      ratingValue: rating <= 5 ? rating - 4 : 1,
                                      size: 12,
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
                                      TextSpan(
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
                                text: const TextSpan(
                                    text:
                                        'Buy now, pay in EMI up to 12 month with any credit Card Later',
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    children: [
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
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),

                            // Description

                            Text(
                              "${" " * 6}$description",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  height: 1.3,
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),

                            //size Space

                            const SizedBox(
                              height: 8,
                            ),

                            // Other Details text
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Text(
                                "Other Details",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
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
                              onTap: () {},
                              borderRadius: BorderRadius.only(
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
    1: FractionColumnWidth(.4),
  }, children: rows);
}
