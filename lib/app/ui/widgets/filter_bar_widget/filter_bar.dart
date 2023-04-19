import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/filter_bar_control/sortby_contorl.dart';
import 'package:project_1/app/provider/filter_bar_provider/filter_bar_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/filter_bar_provider/sortBy_provider.dart';

class CustomFilterBar extends StatefulWidget {
  const CustomFilterBar({Key? key}) : super(key: key);

  @override
  State<CustomFilterBar> createState() => _CustomFilterBarState();
}

class _CustomFilterBarState extends State<CustomFilterBar> {
  final FilterListener _filterListener = FilterListener();

  SortByControl _sortByControl = SortByControl();
  SortByListener _sortByListener = SortByListener();

  @override
  Widget build(BuildContext context) {
    // final filterProvider = Provider.of<FilterListener>(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(0, -2),
              spreadRadius: 1,
              blurRadius: 3)
        ], color: Colors.white),
        child: ListView(
          padding: const EdgeInsets.only(left: 5),
          scrollDirection: Axis.horizontal,
          children: [
            ChangeNotifierProvider<SortByListener>(
              create: (context) => SortByListener(),
              child: Center(
                child: Container(
                  width: 82,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _sortByListener.sortByBool
                              ? Colors.blueAccent
                              : Colors.black12.withOpacity(.2),
                          width: 1.4,
                          strokeAlign: BorderSide.strokeAlignInside),
                      color: _sortByListener.sortByBool
                          ? Colors.blueAccent.withOpacity(.1)
                          : Colors.black12.withOpacity(.05),
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      )),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                      onTap: () {
                        setState(() {
                          _sortByControl.sortByBottomSheet(context);
                          _sortByListener.sortByBool = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Sort By",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Center(
                            child: Container(
                              // color: Colors.red,
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 30,
                                weight: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Center(
              child: Container(
                width: 82,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _filterListener.filterBool
                            ? Colors.blueAccent
                            : Colors.black12.withOpacity(.2),
                        width: 1.4,
                        strokeAlign: BorderSide.strokeAlignInside),
                    color: _filterListener.filterBool
                        ? Colors.blueAccent.withOpacity(.1)
                        : Colors.black12.withOpacity(.05),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    )),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Filter",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Center(
                          child: Container(
                            // color: Colors.red,
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 30,
                              weight: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Center(
              child: Container(
                width: 82,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _filterListener.brandBool
                            ? Colors.blueAccent
                            : Colors.black12.withOpacity(.2),
                        width: 1.4,
                        strokeAlign: BorderSide.strokeAlignInside),
                    color: _filterListener.brandBool
                        ? Colors.blueAccent.withOpacity(.1)
                        : Colors.black12.withOpacity(.05),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    )),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Brand",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Center(
                          child: Container(
                            // color: Colors.red,
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 30,
                              weight: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ));
  }
}
