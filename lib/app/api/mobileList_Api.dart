import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/mobile_list_model.dart';

class MobileListApi {
  static Future<List<MobileListModel>> getMobileList() async {
    print("step 2");

    /*

    var uri = Uri.https("real-time-product-search.p.rapidapi.com", "/search",
        {"q": "MOBILE", "country": "IN", "language": "en"});
    print("getMobileList() step 1");

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "c0b8cb8a1dmsh033cb51bce0a9d2p15255djsn072b7ec6b81e",
      "X-RapidAPI-Host": "real-time-product-search.p.rapidapi.com",
      "useQueryString": "true"
    });


     */

    var data = await rootBundle.loadString('lib/json/mobile_list.json');

    final dataList = jsonDecode(data) as Map<String, dynamic>;

    var cal = dataList['data'] as List;
    print("step 3");

    List<MobileListModel> value = MobileListModel.listFromSnapshot(cal);

    print("step 6");

    return value;
  }
}
