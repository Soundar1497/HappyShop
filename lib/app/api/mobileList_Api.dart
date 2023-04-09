import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/mobile_list_model.dart';

class MobileListApi {
  static Future<List<MobileListModel>> getMobileList() async {
    print("getMobileList() entered ");

    var uri = Uri.https("real-time-product-search.p.rapidapi.com", "/search",
        {"q": "MOBILE", "country": "IN", "language": "en"});
    print("getMobileList() step 1");

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c0b8cb8a1dmsh033cb51bce0a9d2p15255djsn072b7ec6b81e",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body) as Map<String, dynamic>;

    // print(data["info"]["products"]);

    var _temp = data["info"]["products"];
    print("${_temp[1]} and ------------------ ${_temp.runtimeType}");

    // for (var i in data["info"]) {
    //   _temp.add(i["products"]);
    // }
    print("getMobileList() step return");

    return MobileListModel.listFromSnapshot(_temp);
  }
}
