import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../../json/json_controller/category_list.dart';
import '../../../../controllers/carousel_control.dart';
import 'Category_items.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<CategoryList>> readCategory() async {
    print('future start');
    final data = await rootBundle.loadString('lib/json/category_list.json');

    final dataList = jsonDecode(data) as List<dynamic>;
    var dat = dataList.length;
    print("=============== dataList length = $dat ========================");
    print("========== ${dataList} ===========");

    var nam = <CategoryList>[];
    dataList.forEach((e) {
      nam.add(CategoryList.fromJson(e));
      print(nam);
    });

    return nam;
  }

  // Future _pullRefresh() async {
  //   final providerIndex = Provider.of<CarouselListener>(context);
  //   print(providerIndex.pageIndex);
  //
  //   setState(() {
  //     providerIndex.pageIndex = 1;
  //     Navigator.pushReplacementNamed(context, '/dashboard');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    readCategory();
  }

  Duration count = const Duration(days: 5);
  Timer? countdownTimer;

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = count.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        count = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // String val(int n) => n.toString().padLeft(2, '0');
    // final day = val(count.inDays);
    // final hours = val(count.inHours.remainder(24));
    // final min = val(count.inMinutes.remainder(60));
    // final sec = val(count.inSeconds.remainder(60));

    final providerIndex = Provider.of<CarouselListener>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 147, 163, 1.0),
        title: const Text("All Categories"),
        actions: [
          IconButton(
              onPressed: () {
                readCategory();
              },
              icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic_none_outlined))
        ],
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          print(providerIndex.pageIndex);
          setState(() {
            // Navigator.pushReplacementNamed(context, '/dashboard');
            providerIndex.pageIndex = 1;
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Flexible(
            child: Column(
              children: [
                FutureBuilder(
                    future: readCategory(),
                    builder: (context, AsyncSnapshot<List<CategoryList>> data) {
                      if (data.hasError) {
                      } else if (data.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      var item = data.data;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 140,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: .77,
                                  mainAxisSpacing: 15,
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          scrollDirection: Axis.vertical,
                          itemCount: item?.length,
                          itemBuilder: (BuildContext context, i) {
                            return CategoryItem(
                              data: "${item?[i].proName.toString()}",
                              img: "${item?[i].img.toString()}",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, item![1].link.toString());
                                print(
                                    "${item[i].proName.toString()} is Tapped");
                              },
                            );
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
