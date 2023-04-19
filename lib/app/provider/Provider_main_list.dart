import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/carousel_control.dart';
import 'filter_bar_provider/filter_bar_provider.dart';
import 'filter_bar_provider/sortBy_provider.dart';
import 'geolocator_provider/geolocator_provider.dart';

providerMainList() {
  List<SingleChildWidget> providerMainList = [
    ChangeNotifierProvider(create: (context) => FilterListener()),
    ChangeNotifierProvider(create: (context) => SortByListener()),
    ChangeNotifierProvider(create: (context) => CarouselListener()),
    ChangeNotifierProvider(create: (context) => GeoLocatorProvider()),
  ];
  return providerMainList;
}
