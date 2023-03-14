class person {
  List<CardData>? summerCardData;
  List<CardData>? topSectionCardData;

  person.fromJson(Map<String, dynamic> json) {
    if (json["summerCardData"] != null) {
      summerCardData = <CardData>[];
      (json["summerCardData"] as List).forEach((e) {
        summerCardData!.add(CardData.fromJson(e));
      });

      if (json["topSectionCardData"] != null) {
        topSectionCardData = <CardData>[];
        (json["topSectionCardData"] as List).forEach((e) {
          topSectionCardData!.add(CardData.fromJson(e));
        });
      }
    }
  }
}

class CardData {
  String? img;
  String? p_name;
  String? offers;
  CardData.fromJson(Map<String, dynamic> json) {
    img = json["img"];
    p_name = json["p_name"];
    offers = json["offers"];
  }
}
