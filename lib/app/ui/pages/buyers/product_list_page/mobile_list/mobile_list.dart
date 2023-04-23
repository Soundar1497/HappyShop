import 'package:flutter/material.dart';
import 'package:project_1/app/api/mobileList_Api.dart';
import 'package:provider/provider.dart';

import '../../../../../models/mobile_list_model.dart';
import '../../../../../provider/Cart_Provider/cart_Provider.dart';
import '../../../../widgets/cart_navigator_icon.dart';
import '../../../../widgets/filter_bar_widget/filter_bar.dart';
import '../../../../widgets/product_list_listTile/mobile_listTile.dart';

class MobileList extends StatefulWidget {
  const MobileList({Key? key}) : super(key: key);

  @override
  State<MobileList> createState() => _MobileListState();
}

class _MobileListState extends State<MobileList> {
  bool _isloading = true;

  Future<List<MobileListModel>> getMobileList() async {
    print("step 1");

    var data = await MobileListApi.getMobileList();

    print("step 7");

    // var data = await rootBundle.loadString('lib/json/mobile_list.json');
    //
    // final dataList = jsonDecode(data) as Map<String, dynamic>;
    //
    // List<MobileListModel> list = [];
    //
    // var cal = dataList['data'] as List;

/*
    // for (Map i in cal) {
    //   print('index ; product_rating : ${i['product_rating']}');
    //   String val = i['product_rating'].toString();
    //
    //   if (val != "null") {
    //     val = i['product_rating'].toString();
    //   } else {
    //     val = "3.3";
    //   }
    //
    //   print('String of product_rating $val');
    //
    //   double? cal = double.tryParse(val);
    //
    //   print('addition : ${cal! + 2.3}');
    //
    //   MobileListModel _model = MobileListModel(
    //       productTitle: i['product_title'],
    //       productPhotos: i['product_photos'],
    //       productRating: cal);
    //
    //   list.add(_model);
    //   print(_model.productRating);
    // }
    */

    // for (var element in cal) {
    //   print(element);
    //   var cal = MobileListModel.formJson(element);
    //   print(cal.productTitle);
    //   list.add(cal);
    // }
    // print("final");
    return data;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    if (mounted) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
            title: const Text('Mobile Case'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              CartNavigatorIcon(
                isNavigate: true,
              ),
            ],
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  Navigator.pushReplacementNamed(context, '/MobileList');
                });
              },
              child: Column(
                children: [
                  const CustomFilterBar(),
                  FutureBuilder(
                      future: getMobileList(),
                      builder:
                          (context, AsyncSnapshot<List<MobileListModel>> data) {
                        if (data.hasError) {
                        } else if (data.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        //

                        var item1 = data.data;
                        print('length of items : ${item1?.length}');

                        //

                        return Expanded(
                          child: GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 10),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            scrollDirection: Axis.vertical,
                            itemCount: item1?.length,
                            itemBuilder: (BuildContext context, i) {
                              print('Index of grid view : $i');
                              return MobileListTile(
                                productTitle: item1![i].productTitle.toString(),
                                productPhotos: item1[i].productPhotos,
                                productRating: item1[i].productRating,
                                price: item1[i].priceList,
                                productReviews: item1[i].productReviews,
                                productDescription: item1[i].productDescription,
                                productAttributes: item1[i].productAttributes,
                                shipping: item1[i].shipping,
                                storeName: item1[i].storeName,
                              );
                            },
                          ),
                        );
                      })
                ],
              )));
    } else
      return Container();
  }
}
