class CategoryList {
  CategoryList({
    required this.img,
    required this.proName,
  });

  String img;
  String proName;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        img: json["img"],
        proName: json["proName"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "proName": proName,
      };
}
