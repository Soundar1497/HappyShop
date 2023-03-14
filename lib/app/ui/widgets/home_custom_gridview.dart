import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/app/ui/themes/colors.dart';
import 'package:project_1/app/ui/themes/textstyle.dart';
import 'package:project_1/json/json_controller/offer_card_1_controller.dart';

class CustomGridView extends StatefulWidget {
  CustomGridView(
      {Key? key,
      required this.height,
      this.width,
      required this.readJsonData,
      required this.crossAxisCount,
      this.decoration,
      required this.dataText})
      : super(key: key);

  final double height;
  final double? width;
  final int crossAxisCount;
  Decoration? decoration;
  Function readJsonData;
  final String dataText;

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late double childRatio;

  // final List<String> _list = ['a', 'b', 'c', 'd'];

  //
  //
  Future<List<CardData>?> readOffer1() async {
    final data = await rootBundle.loadString('lib/json/offer_card_1.json');

    return widget.readJsonData(data);
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
          margin: const EdgeInsets.symmetric(vertical: 20),
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
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    children: [
                      Container(
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
                                : 85 / childRatio,
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
