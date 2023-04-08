import 'package:flutter/material.dart';
import 'package:project_1/app/ui/widgets/product_list_listTile/mobile_case_listTile.dart';

import '../../../../../api/mobileCaseList_Api.dart';
import '../../../../../models/mobile_case_list_tile_model.dart';
import '../../../../widgets/filter_bar_widget/filter_bar.dart';

class MobileCaseList extends StatefulWidget {
  const MobileCaseList({Key? key}) : super(key: key);

  @override
  State<MobileCaseList> createState() => _MobileCaseListState();
}

class _MobileCaseListState extends State<MobileCaseList> {
  bool _isloading = true;
  List<MobileCaseListModel> _list = [];

  Future getMobileCaseListModel() async {
    print("getMobileCaseListModel() entered ");
    _list = await MobileCaseListApi.getMobileCaseList();

    setState(() {
      _isloading = false;
      print(_isloading);
    });
  }

  @override
  void initState() {
    super.initState();
    getMobileCaseListModel();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      return RefreshIndicator(
        onRefresh: () async {
          setState(() {
            Navigator.pushReplacementNamed(context, '/MobileCaseList');
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
                _isloading
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
                                    crossAxisCount: 2,
                                    childAspectRatio: .59,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1),
                            itemBuilder: (BuildContext context, int i) {
                              if (i < 30) {
                                return MobileCaseListTile(
                                  imgUrl: _list[i].imgUrl.toString(),
                                  goodsName: _list[i].goodsName.toString(),
                                  sellingPrice:
                                      _list[i].sellingPrice.toString(),
                                  originalPrice:
                                      _list[i].originalPrice.toString(),
                                  // review: _list[i].review.toString(),
                                  rating: _list[i].rating.toString(),
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
