class SportsShoeListModel {
  final String? imageUrl;
  final String? title;
  final double? rating;
  final int? review;
  final int? currentPrice;
  final int? beforePrice;
  final int? savingsAmount;
  // final double? savingsPercent;

  SportsShoeListModel({
    this.imageUrl,
    this.title,
    this.rating,
    this.review,
    this.currentPrice,
    this.beforePrice,
    this.savingsAmount,
    // this.savingsPercent
  });

  factory SportsShoeListModel.fromJson(dynamic json) {
    print("stat1");
    double? checkDouble(dynamic value) {
      print(value);
      if (value is double) {
        print(value.runtimeType);
        return value;
      } else if (value is int) {
        print("Data type change to ${value.runtimeType}");

        return value.toDouble();
      } else {
        print("data type of error ${value.runtimeType}");
      }
    }

    return SportsShoeListModel(
      imageUrl: json['thumbnail'] as String,
      title: json['title'] as String,
      rating: checkDouble(json['reviews']["rating"] as dynamic) as double,
      // review: json['reviews']["total_reviews"] as int,
      // currentPrice: json['reviews']["current_price"] as int,
      // beforePrice: json['reviews']["before_price"] as int,
      // savingsAmount: json['reviews']["savings_amount"] as int,
      // // savingsPercent: checkDouble(json['reviews']["savings_percent"]) as double,

      review: json['reviews']["total_reviews"] as int,
      currentPrice: json['price']["current_price"] as int,
      beforePrice: json['price']["before_price"] as int,
      savingsAmount: json['price']["savings_amount"] as int,
      // savingsPercent: json['price']["savings_percent"] as dynamic,
    );
  }

  static List<SportsShoeListModel> listFromSnapshot(List snapshot) {
    print("List<SportsShoeListModel> listFromSnapshot(List snapshot) start");
    return snapshot.map((data) => SportsShoeListModel.fromJson(data)).toList();
  }
}
