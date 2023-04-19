class MobileListModel {
  MobileListModel({
    required this.productTitle,
    required this.productPhotos,
    required this.productRating,
    required this.productReviews,
    required this.priceList,

    // this.productDescription,
    // this.productAttributes,
    // this.sellingPrice,
    // this.originalPrice,
    // this.shipping,
    // this.storeName,
  });

  String productTitle;
  List productPhotos;
  double productRating;
  int productReviews;
  List priceList;

  // final String? productDescription;
  // final Map? productAttributes;

  // final String? sellingPrice;
  // final String? originalPrice;
  // final String? shipping;
  // final String? storeName;

  factory MobileListModel.formJson(Map<String, dynamic> json) {
    print("step 11");

    // Rating null safety
    String val = json['product_rating'].toString();
    //
    if (val != "null") {
      val = json['product_rating'].toString();
    } else {
      val = "3.3";
    }
    double? rating = double.tryParse(val);
    // //
    print("step 12");

    // // Price List null safety
    dynamic priceListJson = json['typical_price_range'].toString();

    print("${priceListJson} : ${priceListJson.runtimeType}");
    List priceList;
    // // //
    if (priceListJson != "null") {
      print("not null");

      // priceList = priceListJson;
      priceList = json['typical_price_range'];
    } else {
      print("null");

      priceList = ["₹18,998.76", "₹20,089.96"];
    }
    print("step 13");

    print(priceList);
    // // //
    // print("step 5");

    return MobileListModel(
      productTitle: json["product_title"] as String,
      productPhotos: json["product_photos"] as List<dynamic>,
      productRating: rating!.toDouble(),
      productReviews: (json["product_num_reviews"]) as int,
      priceList: priceList,

      // productDescription: json["product_description"] as String,
      // productAttributes: json["product_attributes"] as Map<String, dynamic>,
      // shipping: json["offer"]["shipping"] as String,
      // storeName: json["offer"]["store_name"] as String,
    );
  }

  static List<MobileListModel> listFromSnapshot(List<dynamic> snapshot) {
    print("step 4");

    return snapshot.map((e) => MobileListModel.formJson(e)).toList();
  }
}
