class CategoryList {
  CategoryList({
    required this.img,
    required this.proName,
    this.link,
  });

  String img;
  String proName;
  String? link;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
      img: json["img"], proName: json["proName"], link: json["link"]);
}
