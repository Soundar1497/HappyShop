import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:project_1/app/models/filter_bar_model/sortby_model.dart';

import '../../provider/filter_bar_provider/sortBy_provider.dart';
import '../../ui/widgets/filter_bar_widget/sortby_widget.dart';

class SortByControl extends ControllerMVC {
//create factory constructor with the null function
  factory SortByControl() => _this ??= SortByControl._();
  static SortByControl? _this;
  SortByControl._();

// call the sortBy Model class by creating instance or object

  SortByModel sortByModel = SortByModel();

// get the SortBy Option from fireStore

  get getSortByData => sortByModel.getSortByData();
  List get sortByData => sortByModel.sortByData;

//  sortBy bottom sheet
  sortByBottomSheet(BuildContext context) {
    SortByListener _sortByListener = SortByListener();

    return showModalBottomSheet(
        // isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) {
          return SortBySheet();
        });
  }
}
