import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/mobile_case_list_tile_model.dart';

class MobileCaseListApi {
  static Future<List<MobileCaseListModel>> getMobileCaseList() async {
    print("getMobileCaseList() entered ");
    var uri = Uri.https("unofficial-shein.p.rapidapi.com", "/products/search", {
      "keywords": "poco mobile",
      "language": "en",
      "country": "US",
      "currency": "USD",
      "limit": "30",
      "page": "5"
    });
    print("getMobileCaseList() step 1");

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c0b8cb8a1dmsh033cb51bce0a9d2p15255djsn072b7ec6b81e",
      "X-RapidAPI-Host": "unofficial-shein.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body) as Map<String, dynamic>;

    // print(data["info"]["products"]);

    var _temp = data["info"]["products"];
    print("${_temp[1]} and ------------------ ${_temp.runtimeType}");

    // for (var i in data["info"]) {
    //   _temp.add(i["products"]);
    // }
    print("getMobileCaseList() step return");

    return MobileCaseListModel.listFromSnapshot(_temp);
  }
}
