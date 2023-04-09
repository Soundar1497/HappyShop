import 'package:flutter/material.dart';

import '../../../../../models/mobile_list_model.dart';
import '../../../../widgets/filter_bar_widget/filter_bar.dart';
import '../../../../widgets/product_list_listTile/mobile_listTile.dart';

class MobileList extends StatefulWidget {
  const MobileList({Key? key}) : super(key: key);

  @override
  State<MobileList> createState() => _MobileListState();
}

class _MobileListState extends State<MobileList> {
  bool _isloading = true;
  List<MobileListModel> list = [];

  // Future getMobileListModel() async {
  //   print("getMobileListModel() entered ");
  //   _list = await MobileListApi.getMobileList();
  //
  //   setState(() {
  //     _isloading = false;
  //     print(_isloading);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getMobileListModel();
  }

  List _list1 = [
    "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRdyiKeCaQ84IkvAeIcbk-grKEmYt-rXgp44FLnqDX2FWAxEEb_i9gvMzlAY1Lm4YUXF0ysO7PHZ0Yyw0nHU_MSLWHfvi1m&usqp=CAE",
    "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTs8poVibX2xt47csJpY9ue27OJpZB0chMl9rll_ZcwqaDdYFj5N-6wcUSc8FjT1GzDs9KvcOkMXuobKboapwvB_hwpaRQl4w&usqp=CAE",
    "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT1z1nmihK_BvEsQqzYB_YnfEMRiCQC0GvvfeBCg2bIV2dytug2fIiWnOi6P3jS4igBDoVH02_FPc8m2COotue0iTA4_2oAIg&usqp=CAE",
    "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTbAsy1G1dJyHZE2VLSZ8VrWn_uUqjt6OAhwZN_ysnx1a1vx4lNCUMHAPdD0-G_Rkdi8bFFig7Cfo12yKADG-Or5t5AtuBv2Q&usqp=CAE",
    "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQiEzvnGxZo_x7UYv0lAKYVwVwtjUjSgOQIIaoJ-uiL4LR-0F8Es5N3JdhiOAVzR7ixokOsZ6sZvwAJp9hhPk1HQqh3fALX&usqp=CAE"
  ];

  List _price = ["₹18,998.76", "₹20,089.96"];

  double _rating = 4.8;

  String _review = "1980454415473698836";

  Map attri = {
    "Features": "Smartphone",
    "SIM Slots": "Single SIM",
    "Broadband Generation": "5G",
    "Colour": "Hyperspace"
  };

  String ship = "Free delivery by Tue, 18 Apr";

  String discri =
      "Carry The Realme 10 Pro 5g With You Wherever You Go To Catch People's Attention. You Can Enjoy A Large Screen Size With A Significantly Compact Frame Thanks To The 17.06 Cm 6.72 Screen And 93.76% Screen-to-body Ratio, And The 120 Hz Refresh Rate Provides You With A Fantastic User Experience. Additionally, This Smartphone Enables Exceptional Photography And Filmmaking Abilities That Let You Record Precious Moments Thanks To Its 108 Mp Prolight Camera. Furthermore, The Realme 10 Pro 5g's Snapdragon 695 5g Chipset Is Produced Utilising A Flawless 6 Nm Production Process, Which Results In A Power-efficient Phone. Moreover, The Realme 10 Pro 5g's Massive 8 Gb + 8 Gb Dynamic Ram Design Makes It Simple To Switch Between Programmes, Play Games, And Access Numerous Files.";
  String storeName = "Flipkart";
  @override
  Widget build(BuildContext context) {
    if (mounted) {
      return RefreshIndicator(
        onRefresh: () async {
          setState(() {
            Navigator.pushReplacementNamed(context, '/MobileList');
          });
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
            title: const Text('Mobile Case'),
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const CustomFilterBar(),
                false
                    ? const Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator())),
                        ),
                      )
                    : Flexible(
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 6),
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1),
                            itemBuilder: (BuildContext context, int i) {
                              if (i < 30) {
                                return MobileListTile(
                                  productTitle:
                                      'realme 10 Pro 5G (6GB RAM, 128GB, Hyperspace)',
                                  productPhotos: _list1,
                                  productRating: _rating,
                                  price: _price,
                                  productReviews: _review,
                                  productDescription: discri,
                                  productAttributes: attri,
                                  shipping: ship,
                                  storeName: storeName,
                                );
                              }
                            },
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    } else
      return Container();
  }
}
