import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_1/app/models/sports_shoe_list_model.dart';

class SportsShoeListApi {
  static Future<List<SportsShoeListModel>> getSportsShoeListModel() async {
    print("Future<List<SportsShoeListModel>> start");
    // var uri1 = Uri.https(
    //   "amazon23.p.rapidapi.com",
    //   "/product-search",
    // );
    // final response = await http.get(uri1);

    var uri = Uri.https("amazon23.p.rapidapi.com", "/product-search",
        {"query": "sports shoe", "country": "IN"});
    print("Future<List<SportsShoeListModel>> start response");

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c0b8cb8a1dmsh033cb51bce0a9d2p15255djsn072b7ec6b81e",
      "X-RapidAPI-Host": "amazon23.p.rapidapi.com",
      "useQueryString": "true"
    });
    print("Future<List<SportsShoeListModel>> finish response");
    // print(response.body);

    // List _temp = [];
    Map data = jsonDecode(response.body);
    // for (var i in data["result"]) {
    //   _temp.add(i[i]);
    // }
    // print(_temp);
    print("Future<List<SportsShoeListModel>> returning response");
    print(data);

    return SportsShoeListModel.listFromSnapshot(data["result"]);
  }
}
