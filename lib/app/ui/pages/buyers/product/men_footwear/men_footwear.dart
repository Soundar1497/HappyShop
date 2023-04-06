import "package:flutter/material.dart";

import '../../../../widgets/filter_bar_widget/filter_bar.dart';

class FootwearPuma extends StatefulWidget {
  const FootwearPuma({Key? key}) : super(key: key);

  @override
  State<FootwearPuma> createState() => _FootwearPumaState();
}

class _FootwearPumaState extends State<FootwearPuma> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          Navigator.pushReplacementNamed(context, '/FootwearPuma');
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(245, 147, 163, 1.0),
          title: const Text('Mens FootWears'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined)),
          ],
        ),
        body: Column(
          children: [
            const CustomFilterBar(),
            Expanded(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      color: Colors.yellowAccent,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
