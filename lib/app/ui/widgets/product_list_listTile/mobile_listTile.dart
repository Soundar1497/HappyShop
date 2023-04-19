import "package:flutter/material.dart";

import "../star_rating_icon/star_rating_icon.dart";

class MobileListTile extends StatefulWidget {
  const MobileListTile({
    Key? key,
    required this.productTitle,
    required this.productPhotos,
    required this.productRating,
    required this.productReviews,
    required this.productDescription,
    required this.productAttributes,
    required this.price,
    required this.shipping,
    required this.storeName,
  }) : super(key: key);

  final String productTitle;
  final List productPhotos;
  final double productRating;
  final int productReviews;

  final String productDescription;
  final Map productAttributes;
  final List price;
  final String shipping;
  final String storeName;

  @override
  State<MobileListTile> createState() => _MobileListTileState();
}

class _MobileListTileState extends State<MobileListTile> {
  String text1 =
      "Reebok Men's Energy Runner LP Nacho/Conavy/None Running Shoes";

  @override
  Widget build(BuildContext context) {
    var imgUrl = widget.productPhotos[0];
    var rating = widget.productRating;
    var review = widget.productReviews;
    var sellingPrice = widget.price[0];
    var originalPrice = widget.price[1];
    var savingPrice = calculateSaving(sellingPrice, originalPrice);

    return Padding(
      padding: EdgeInsets.all(4),
      child: Stack(children: [
        Container(
          // width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(.5, 1),
                    blurRadius: 1.5,
                    spreadRadius: 1)
              ],
              color: Color.fromRGBO(252, 234, 237, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 140,
                  height: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-.5, .5),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product Name

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 4,
                            right: 4,
                          ),
                          child: Text(
                            widget.productTitle.length < 42
                                ? widget.productTitle
                                : "${widget.productTitle.substring(0, 42)}...",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),

                        // Rating Icon

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 4,
                            right: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // rating in text
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text("$rating"),
                              ),

                              // 5 star icon

                              StarRatingIcon(
                                ratingValue: rating <= 1 && rating > 0
                                    ? rating
                                    : rating > 1
                                        ? 1
                                        : 0,
                                size: 16,
                              ),
                              StarRatingIcon(
                                ratingValue: rating <= 2 && rating > 1
                                    ? rating - 1
                                    : rating > 2
                                        ? 1
                                        : 0,
                                size: 16,
                              ),
                              StarRatingIcon(
                                ratingValue: rating <= 3 && rating > 2
                                    ? rating - 2
                                    : rating > 3
                                        ? 1
                                        : 0,
                                size: 16,
                              ),
                              StarRatingIcon(
                                ratingValue: rating <= 4 && rating > 3
                                    ? rating - 3
                                    : rating > 4
                                        ? 1
                                        : 0,
                                size: 16,
                              ),
                              StarRatingIcon(
                                ratingValue: rating <= 5 && rating > 4
                                    ? rating - 4
                                    : rating > 5
                                        ? 1
                                        : 0,
                                size: 16,
                              ),

                              // product review

                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  "(${review}review)",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // price detail

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 4,
                            right: 4,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // selling price

                              Padding(
                                padding: const EdgeInsets.only(right: 6),
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
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Saving Price

                        Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              left: 4,
                              right: 4,
                            ),
                            child: Text(
                              "(You can save ₹$savingPrice)",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              splashColor: Colors.redAccent.withOpacity(.2),
              highlightColor: Colors.orangeAccent.withOpacity(.1),
              onTap: () {
                Navigator.pushNamed(context, '/MobileListDetail', arguments: [
                  widget.productTitle,
                  widget.productPhotos,
                  rating,
                  review,
                  sellingPrice,
                  originalPrice,
                  savingPrice,
                  widget.productDescription,
                  widget.productAttributes,
                  widget.shipping,
                  widget.storeName,
                ]);
              },
            ),
          ),
        )
      ]),
    );
  }
}

String calculateSaving(sp, op) {
  //
  //
  var val1 = op.toString().substring(1).split(",");
  var originalPrice = double.parse(val1[0] + val1[1]);

  //
  //

  var val2 = sp.toString().substring(1).split(",");
  var sellingPrice = double.parse(val2[0] + val2[1]);

  //
  //

  var saving = originalPrice - sellingPrice;
  var savingPrice = saving.toStringAsFixed(0);

  return savingPrice;
}
