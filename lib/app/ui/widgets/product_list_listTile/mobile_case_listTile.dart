import "package:flutter/material.dart";

import "../star_rating_icon/star_rating_icon.dart";

class MobileCaseListTile extends StatefulWidget {
  const MobileCaseListTile(
      {Key? key,
      required this.imgUrl,
      required this.goodsName,
      required this.sellingPrice,
      required this.originalPrice,
      // required this.review,
      required this.rating})
      : super(key: key);

  final String imgUrl;
  final String goodsName;
  final String sellingPrice;
  final String originalPrice;
  // final String review;
  final String rating;

  @override
  State<MobileCaseListTile> createState() => _MobileCaseListTileState();
}

class _MobileCaseListTileState extends State<MobileCaseListTile> {
  String text1 =
      "Reebok Men's Energy Runner LP Nacho/Conavy/None Running Shoes";

  @override
  Widget build(BuildContext context) {
    var sellingPrice = double.parse(
        (double.parse(widget.sellingPrice!) * 81.84).toStringAsFixed(2));
    var originalPrice = double.parse(
        ((double.parse(widget.originalPrice!) * 81.84) * 1.4)
            .toStringAsFixed(2));
    var savingPrice = (originalPrice - sellingPrice).toStringAsFixed(2);
    var rating = double.parse(((((double.parse(widget.rating!)) == 0
            ? 4.4
            : (double.parse(widget.rating!) - .4))))
        .toStringAsFixed(1));

    var review = (originalPrice + 99).toString().substring(0, 3);
    return Container(
      padding: EdgeInsets.all(4),
      child: Container(
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
          child: Center(
            child: Column(
              children: [
                //Image

                Container(
                  width: 150,
                  height: 180,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-.5, .5),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      widget.imgUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Product Name

                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 4,
                    right: 4,
                  ),
                  child: Text(
                    widget.goodsName!.length > 34
                        ? "${widget.goodsName!.substring(0, 34)}..."
                        : widget.goodsName!,
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
                        ratingValue: rating < 1 ? rating : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue: rating < 2 ? rating - 1 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue: rating < 3 ? rating - 2 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue: rating < 4 ? rating - 3 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue: rating <= 5 ? rating - 4 : 1,
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
                        child: Row(
                          children: [
                            const Text(
                              "₹",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              sellingPrice.toString(),
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),

                      // original price

                      Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Text(
                          originalPrice.toString(),
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
      ),
    );
  }
}
