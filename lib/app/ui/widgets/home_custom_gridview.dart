import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/app/ui/themes/colors.dart';
import 'package:project_1/app/ui/themes/textstyle.dart';
import 'package:project_1/json/json_controller/offer_card_1_controller.dart';

import '../../../json/json_controller/grid_list_card_controller.dart';

class CustomGridViewOne extends StatefulWidget {
  CustomGridViewOne({
    Key? key,
    required this.height,
    required this.cardIndex,
    this.width,
    required this.crossAxisCount,
    this.decoration,
    required this.dataText,
  }) : super(key: key);

  final double height;
  final double? width;
  final int crossAxisCount;
  Decoration? decoration;
  final String dataText;
  final int cardIndex;

  @override
  State<CustomGridViewOne> createState() => _CustomGridViewOneState();
}

class _CustomGridViewOneState extends State<CustomGridViewOne> {
  late double childRatio;

  // final List<String> _list = ['a', 'b', 'c', 'd'];

  //
  //
  Future<List<CardData>?> readOffer1() async {
    final data = await rootBundle.loadString('lib/json/offer_card_1.json');
    final offerCard = jsonDecode(data) as Map<String, dynamic>;
    var obj = person.fromJson(offerCard);
    List card = [
      obj.summerCardData,
      obj.topSectionCardData,
      obj.bestQualityCardData
    ];

    // return widget.readJsonData(data);
    return card[widget.cardIndex];
  }

  @override
  Widget build(BuildContext context) {
    childRatio = widget.crossAxisCount == 2
        ? (1 / ((1 / 450) * widget.height).toDouble())
        : (1 / ((1.55 / 450) * widget.height).toDouble());

    return FutureBuilder(
      future: readOffer1(),
      builder: (context, AsyncSnapshot<List<CardData>?> data) {
        if (data.hasError) {
          print(
              '----------------------------- ${data.error} ------------------------------');
        } else if (data.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        //
        var items = data.data as List<CardData>;

        //
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: widget.width ?? MediaQuery.of(context).size.width,
          //widget.width
          height: widget.height ?? 600,
          //widget.height
          decoration: widget.decoration ??
              const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  // SplashColor.splashColor1,
                  SplashColor.splashColor2,
                  SplashColor.splashColor3,
                  // SplashColor.splashColor4,
                  // SplashColor.splashColor5,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 56,
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.dataText,
                      style: CustomTextStyle.h1(context),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26.withOpacity(0.5),
                                spreadRadius: .3,
                                blurRadius: .1,
                                offset: const Offset(0, .5))
                          ],
                          color: Colors.blueAccent.withOpacity(.8)),
                      child: InkWell(
                        splashFactory: InkSparkle.splashFactory,
                        customBorder: CircleBorder(),
                        splashColor: Colors.red,
                        focusColor: Colors.green,
                        hoverColor: Colors.yellow,
                        overlayColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains('MaterialState.pressed')) {
                            return Colors.purple;
                          }
                          return const Color(0xffc72c00);
                        }),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // radius: 150,
                        onTap: () {
                          print('hai');
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                    )
                  ]),
            ),

            // grid view counter

            /*
              GridView.count(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  childAspectRatio: childRatio,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  children: _list
                      .map((data) => InkWell(
                            onTap: () {
                              print('card tapped');
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 110 / childRatio,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        top: 115 / childRatio,
                                        left: 10,
                                        right: 10),
                                    color: Colors.yellow,
                                    child: Text(
                                      'Sports Shoe',
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyle.p1(context),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        top: 134 / childRatio,
                                        left: 10,
                                        right: 10),
                                    color: Colors.yellow,
                                    child: Text(
                                      'Min. 50% off',
                                      style: CustomTextStyle.hl1(context),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ))
                      .toList()),

               */
            // grid view counter

            //      grid view builder

            GridView.builder(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: childRatio,
                  mainAxisSpacing: 15,
                  crossAxisCount: widget.crossAxisCount,
                  crossAxisSpacing: 15),
              itemBuilder: (context, i) {
                return Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, items[i].navigator.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: widget.crossAxisCount == 2
                              ? 110 / childRatio
                              : 60 / childRatio,
                          // color: Colors.red,
                          child: ClipRect(
                              child: Image.network(
                            items[i].img.toString(),
                            // "",
                            // items[i].summerCardData,
                            // items[i].summerOffer.img.toString(),
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: widget.crossAxisCount == 2
                                  ? 116 / childRatio
                                  : 65 / childRatio,
                              left: 10,
                              right: 10),
                          // color: Colors.yellow,
                          child: Text(
                            items[i].p_name.toString(),
                            // "",
                            // items[i].p_name.toString(),
                            // '${items[i].p_name}',
                            textAlign: TextAlign.left,
                            style: widget.crossAxisCount == 2
                                ? CustomTextStyle.p1(context)
                                : CustomTextStyle.p2(context),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: widget.crossAxisCount == 2
                                  ? 135 / childRatio
                                  : 86.5 / childRatio,
                              left: 10,
                              right: 10),
                          // color: Colors.yellow,
                          child: Text(
                            items[i].offers.toString(),

                            // "",
                            // items[i].offers.toString(),

                            // items[i].offers.toString(),
                            style: widget.crossAxisCount == 2
                                ? CustomTextStyle.hl1(context)
                                : CustomTextStyle.hl2(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              },
            )

            //      grid view builder
          ]),
        );
      },
    );
  }
}

//
//
//
//
//

class CustomGridViewTwo extends StatefulWidget {
  CustomGridViewTwo({Key? key, required this.cardIndex, required this.color})
      : super(key: key);

  final int cardIndex;
  final Color color;

  @override
  State<CustomGridViewTwo> createState() => _CustomGridViewTwoState();
}

class _CustomGridViewTwoState extends State<CustomGridViewTwo> {
  late double childRatio;

  Future<List<GridListCardData>?> readGridListData() async {
    final data = await rootBundle.loadString('lib/json/grid_list_card.json');
    final gridListData = jsonDecode(data) as Map<String, dynamic>;
    var obj = GridCardData.fromJson(gridListData);
    List card = [
      obj.gridList_1_2e,
      obj.gridList_2_4e,
    ];
    return card[widget.cardIndex];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readGridListData(),
      builder: (context, AsyncSnapshot<List<GridListCardData>?> data) {
        if (data.hasError) {
        } else if (data.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        //
        var items = data.data as List<GridListCardData>;

        //
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          child: GridView.builder(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.65,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                crossAxisSpacing: 15),
            itemBuilder: (context, i) {
              return Card(
                  color: widget.color,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, items[i].navigator.toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 175,
                              // color: Colors.red,
                              child: ClipRect(
                                  child: Image.network(
                                items[i].img.toString(),
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                              )),
                            ),
                          ),
                          items[i].position.toString().contains('true')
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: MediaQuery.of(context).size.width,
                                    color: Color(0xffe3fcbf),
                                    child: Text(
                                      items[i].date_validity.toString(),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.hl3(context),
                                    ),
                                  ),
                                )
                              : items[i].position.toString().contains('false')
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 6),
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffe70101),
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0)),
                                          border:
                                              Border.all(color: Colors.white70),
                                        ),
                                        child: Text(
                                          items[i].date_validity.toString(),
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyle.hl4(context),
                                        ),
                                      ),
                                    )
                                  : Container(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(top: 185, left: 10, right: 10),
                            // color: Colors.yellow,
                            child: Text(
                              items[i].p_name.toString(),
                              style: CustomTextStyle.h2(context),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 208, left: 10),
                            // color: Colors.yellow,
                            child: Text(
                              items[i].spec_detail.toString(),
                              // "",
                              // items[i].p_name.toString(),
                              // '${items[i].p_name}',
                              textAlign: TextAlign.left,
                              style: CustomTextStyle.p4(context),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 232, left: 10),

                              // color: Colors.yellow,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[i].price.toString(),
                                    style: CustomTextStyle.hl5(context),
                                  ),
                                  items[i]
                                              .old_price
                                              .toString()
                                              .contains("null") ||
                                          items[i]
                                                  .old_price
                                                  .toString()
                                                  .length <=
                                              0
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "",
                                            style: CustomTextStyle.p3(context),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            items[i].old_price.toString(),
                                            // items[i].offers.toString(),
                                            style: CustomTextStyle.p3(context),
                                          ),
                                        ),
                                  items[i].offer.toString().contains("null")
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "",
                                            style: CustomTextStyle.p3(context),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            items[i].offer.toString(),
                                            // items[i].offers.toString(),
                                            style: CustomTextStyle.hl2(context),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}
