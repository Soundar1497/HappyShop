import 'package:cloud_firestore/cloud_firestore.dart';

class SortByModel {
  final CollectionReference sortBy =
      FirebaseFirestore.instance.collection('FilterBar');

  List sortByData = [];

  Future getSortByData() async {
    try {
      sortByData.clear();
      print("*************** ${sortByData} ***********************");

      CollectionReference users =
          FirebaseFirestore.instance.collection('FilterBar');
      final snapshot = users.doc('sortBy').get();
      print("*************** ${snapshot} ***********************");

      snapshot.then((value) {
        var data1 = value.data() as Map;
        print(data1.length);
        data1.forEach((k, v) {
          print("$k");
          int i = int.parse(k);
          sortByData.insert(i, "$v");
        });
        print("//////////$sortByData/////////////////////");
      });
    } catch (e) {
      print("=======error====== $e ========error==========");
    }
  }
}
