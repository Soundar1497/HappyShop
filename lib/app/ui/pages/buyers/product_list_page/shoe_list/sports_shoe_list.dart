import "package:flutter/material.dart";
import 'package:project_1/app/api/sports_shoe_Api.dart';

import '../../../../../models/sports_shoe_list_model.dart';
import '../../../../widgets/filter_bar_widget/filter_bar.dart';
import '../../../../widgets/product_list_listTile/sports_shoe_list_tile.dart';

class SportsShoeList extends StatefulWidget {
  const SportsShoeList({Key? key}) : super(key: key);

  @override
  State<SportsShoeList> createState() => _SportsShoeListState();
}

class _SportsShoeListState extends State<SportsShoeList> {
  List<SportsShoeListModel>? _list;
  bool _isLoading = true;

  Future getSportsShoeListModel() async {
    print("future Start");
    _list = await SportsShoeListApi.getSportsShoeListModel();
    setState(() {
      _isLoading = false;
    });
    print(_list);
  }

  @override
  void initState() {
    super.initState();
    getSportsShoeListModel();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          Navigator.pushReplacementNamed(context, '/SportsShoeList');
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
          title: const Text('Mens FootWears'),
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
        body: Column(
          children: [
            const CustomFilterBar(),
            // _list == null || _list!.isEmpty
            _isLoading
                ? Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                          child: Container(
                              height: 30,
                              child: const CircularProgressIndicator())),
                    ),
                  )
                : Expanded(
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
                          if (i < 45) {
                            return SportsShoeListTile(
                              imageUrl: _list![i].imageUrl,
                              title: _list![i].title,
                              rating: _list![i].rating,
                              review: _list![i].review,
                              currentPrice: _list![i].currentPrice,
                              beforePrice: _list![i].beforePrice,
                              savingsAmount: _list![i].savingsAmount,
                              // savingsPercent: _list![i].savingsPercent,
                            );
                          }
                        },
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
