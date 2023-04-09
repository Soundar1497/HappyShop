class MobileListModel {
  MobileListModel({
    this.productTitle,
    this.productDescription,
    this.productPhotos,
    this.productAttributes,
    this.productRating,
    this.productReviews,
    this.price,
    // this.sellingPrice,
    // this.originalPrice,
    this.shipping,
    this.storeName,
  });

  final String? productTitle;
  final String? productDescription;
  final List? productPhotos;
  final Map? productAttributes;
  final double? productRating;
  final String? productReviews;
  final List? price;
  // final String? sellingPrice;
  // final String? originalPrice;
  final String? shipping;
  final String? storeName;

  factory MobileListModel.formJson(Map<String, dynamic> json) {
    return MobileListModel(
      productTitle: json["product_title"] as String,
      productDescription: json["product_description"] as String,
      productPhotos: json["product_photos"] as List<String>,
      productAttributes: json["product_attributes"] as Map<String, String>,
      productRating: double.parse((json["product_rating"]).toString()),
      productReviews: json["product_id"] as String,
      price: json["typical_price_range"] as List<String>,
      shipping: json["offer"]["shipping"] as String,
      storeName: json["offer"]["store_name"] as String,
    );
  }

  static List<MobileListModel> listFromSnapshot(List<dynamic> snapshot) {
    print("listFromSnapshot(List snapshot) step return");
    print(snapshot);
    return snapshot.map((e) => MobileListModel.formJson(e)).toList();
  }
}
