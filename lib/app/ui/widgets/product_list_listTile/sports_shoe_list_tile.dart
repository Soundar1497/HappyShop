import "package:flutter/material.dart";

import "../star_rating_icon/star_rating_icon.dart";

class SportsShoeListTile extends StatefulWidget {
  const SportsShoeListTile({
    Key? key,
    this.imageUrl,
    this.title,
    this.rating,
    this.review,
    this.currentPrice,
    this.beforePrice,
    this.savingsAmount,
    // this.savingsPercent
  }) : super(key: key);
  final String? imageUrl;
  final String? title;
  final double? rating;
  final int? review;
  final int? currentPrice;
  final int? beforePrice;
  final int? savingsAmount;
  // final double? savingsPercent;

  @override
  State<SportsShoeListTile> createState() => _SportsShoeListTileState();
}

class _SportsShoeListTileState extends State<SportsShoeListTile> {
  String text1 =
      "Reebok Men's Energy Runner LP Nacho/Conavy/None Running Shoes";

  @override
  Widget build(BuildContext context) {
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
                Container(
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
                      widget.imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 4,
                    right: 4,
                  ),
                  child: Text(
                    widget.title!.length > 35
                        ? "${widget.title!.substring(0, 35)}..."
                        : widget.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 4,
                    right: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(widget.rating!.toString()),
                      ),
                      StarRatingIcon(
                        ratingValue: widget.rating!.toDouble() < 1
                            ? widget.rating!.toDouble()
                            : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue:
                            widget.rating! < 2 ? widget.rating! - 1 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue:
                            widget.rating! < 3 ? widget.rating! - 2 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue:
                            widget.rating! < 4 ? widget.rating! - 3 : 1,
                        size: 16,
                      ),
                      StarRatingIcon(
                        ratingValue:
                            widget.rating! < 5 ? widget.rating! - 4 : 1,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(widget.review!.toString()),
                      ),
                    ],
                  ),
                ),
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
                              widget.currentPrice.toString(),
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Text(
                          "₹${widget.beforePrice}",
                          style: const TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 6),
                      //   child: Text(
                      //     ("(${widget.savingsPercent!.toInt()}% off)"),
                      //     style: TextStyle(
                      //         color: Colors.black54,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 4,
                      right: 4,
                    ),
                    child: Text(
                      "(You can save ₹${widget.savingsAmount})",
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
