class GridCardData {
  List<GridListCardData>? gridList_1_2e;
  List<GridListCardData>? gridList_2_4e;

  GridCardData({this.gridList_1_2e, this.gridList_2_4e});

  GridCardData.fromJson(Map<String, dynamic> json) {
    if (json["gridList_1_2e"] != null) {
      gridList_1_2e = <GridListCardData>[];
      (json["gridList_1_2e"] as List).forEach((e) {
        gridList_1_2e!.add(GridListCardData.fromJson(e));
      });

      if (json["gridList_2_4e"] != null) {
        gridList_2_4e = <GridListCardData>[];
        (json["gridList_2_4e"] as List).forEach((e) {
          gridList_2_4e!.add(GridListCardData.fromJson(e));
        });
      }
    }
  }
}

class GridListCardData {
  String? img;
  String? date_validity;
  String? position;
  String? p_name;
  String? spec_detail;
  String? price;
  String? old_price;
  String? navigator;
  String? offer;

  GridListCardData(
      {required this.img,
      this.date_validity,
      this.position,
      required this.p_name,
      required this.spec_detail,
      required this.price,
      this.navigator,
      this.offer,
      this.old_price});

  GridListCardData.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    date_validity = json['date_validity'];
    position = json['position'];
    p_name = json['p_name'];
    spec_detail = json['spec_detail'];
    price = json['price'];
    old_price = json['old_price'];
    navigator = json["navigator"];
    offer = json['offer'];
  }
}
