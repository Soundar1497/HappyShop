import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../controllers/filter_bar_control/sortby_contorl.dart";
import "../../../provider/filter_bar_provider/sortBy_provider.dart";

class SortBySheet extends StatefulWidget {
  const SortBySheet({Key? key}) : super(key: key);

  @override
  State<SortBySheet> createState() => _SortBySheetState();
}

class _SortBySheetState extends State<SortBySheet> {
  SortByControl _sortByControl = SortByControl();
  SortByListener _sortByListener = SortByListener();

  String tex1 = "";

  void loadSortData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sortByListener.onRadioChange = (prefs.getString('SortPoint'))!;
    });
  }

  void saveSortData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      (prefs.setString('SortPoint', _sortByListener.onRadioChange));
      print("SharedPreferences Saved done");
    });
  }

  void initSortData() async {
    final prefs = await SharedPreferences.getInstance();
    _sortByListener.onRadioChange =
        prefs.getString('SortPoint') ?? _sortByListener.onRadioChange;
    setState(() {
      (prefs.setString('SortPoint', _sortByListener.onRadioChange));
    });
  }

  @override
  void initState() {
    super.initState();
    initSortData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Text(
                "SORT BY",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              // color: Colors.red,
              child: ListView.builder(
                  itemCount: _sortByControl.sortByData.length,
                  itemBuilder: (context, i) {
                    var data = _sortByControl.sortByData[i];
                    return Container(
                      // color: Colors.yellowAccent,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          print("${_sortByControl.sortByData[i]}");
                          setState(() {
                            _sortByListener.onRadioChange =
                                _sortByControl.sortByData[i];
                            saveSortData();
                            _sortByListener.sortByBool = true;
                            print(_sortByListener.sortByBool);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${data}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Radio(
                                value: data,
                                groupValue: _sortByListener.onRadioChange,
                                onChanged: (value) {
                                  print("$value");
                                  setState(() {
                                    _sortByListener.onRadioChange =
                                        _sortByControl.sortByData[i];
                                    saveSortData();
                                    _sortByListener.sortByBool = true;
                                    print(_sortByListener.sortByBool);
                                  });
                                  // setState(() {
                                  //   tex1 = value.toString();
                                  //   saveSortData();
                                  //   _sortByListener.sortByBool = true;
                                  //   print(_sortByListener.sortByBool);
                                  // });
                                })
                          ],
                        ),
                      ),
                    );
                  }),
            )

            // Stream Builder
          ],
        ));
  }
}
