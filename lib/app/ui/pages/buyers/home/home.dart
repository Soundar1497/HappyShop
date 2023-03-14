import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/widgets/appbar_home.dart';
import 'package:project_1/app/ui/widgets/home_carousel.dart';
import 'package:project_1/app/ui/widgets/home_custom_gridview.dart';
import 'package:project_1/json/json_controller/offer_card_1_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authen _authen = Authen();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        // App Bar
        AppBarHomePage(),
        CarouselScreen(),

        //
        //  Cool Summer Offer
        //
        CustomGridView(
          crossAxisCount: 2,
          height: 450,
          readJsonData: (data) {
            var file = data;
            final myapp = jsonDecode(file) as Map<String, dynamic>;
            var obj = person.fromJson(myapp);
            var dd = obj.summerCardData;
            return dd;
          },
          dataText: 'Cool Summer Offers',
        ),
        CustomGridView(
          decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.darken,
            image: DecorationImage(
                opacity: 0.05,
                image: NetworkImage(
                    'https://isorepublic.com/wp-content/uploads/2021/03/iso-republic-pastel-flower-petals-free-stock-photo-1100x733.jpg'),
                fit: BoxFit.cover),
            gradient: LinearGradient(colors: [
              Color(0xff7f7fd2),
              Color(0xff6e6ef0),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          crossAxisCount: 3,
          height: 450,
          readJsonData: (data) {
            var file = data;
            final myapp = jsonDecode(file) as Map<String, dynamic>;
            var obj = person.fromJson(myapp);
            var dd = obj.topSectionCardData;
            return dd;
          },
          dataText: 'Top Sections',
        ),
      ],
    ));
  }
}
