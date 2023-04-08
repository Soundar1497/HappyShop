class MobileCaseListModel {
  MobileCaseListModel(
      {this.imgUrl,
      this.goodsName,
      this.sellingPrice,
      this.originalPrice,
      this.rating});

  final String? imgUrl;
  final String? goodsName;
  final String? sellingPrice;
  final String? originalPrice;

  final String? rating;

  factory MobileCaseListModel.formJson(Map<String, dynamic> json) {
    return MobileCaseListModel(
      imgUrl: json["goods_img"] as String,
      goodsName: json["goods_name"] as String,
      sellingPrice: json["retailPrice"]["amount"] as String,
      originalPrice: json["salePrice"]["amount"] as String,
      rating: json["comment_rank_average"] as String,
    );
  }

  static List<MobileCaseListModel> listFromSnapshot(List<dynamic> snapshot) {
    print("listFromSnapshot(List snapshot) step return");
    print(snapshot);
    return snapshot.map((e) => MobileCaseListModel.formJson(e)).toList();
  }
}
