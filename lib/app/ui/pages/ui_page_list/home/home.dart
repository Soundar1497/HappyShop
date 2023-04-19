import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/carousel_control.dart';
import '../../../../models/authentication_model.dart';
import '../../../widgets/home_appbar.dart';
import '../../../widgets/home_carousel.dart';
import '../../../widgets/home_custom_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authen _authen = Authen();
  AuthenticationModel _AuthenticationModel = AuthenticationModel();
  bool value = true;
  // CarouselListener value1 = CarouselListener();
  Future _pullRefresh() async {
    setState(() {
      Navigator.pushReplacementNamed(context, '/dashboard');
    });
  }

  Future _find() async {
    var val = await _AuthenticationModel.findUserIndex();
    setState(() {
      _AuthenticationModel.userIndex = val;
      print(
          "${_AuthenticationModel.userIndex} : type ${_AuthenticationModel.userIndex.runtimeType}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _find();
  }

  @override
  Widget build(BuildContext context) {
    final providerIndex = Provider.of<CarouselListener>(context);

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        print(providerIndex.pageIndex);
        setState(() {
          // Navigator.pushReplacementNamed(context, '/dashboard');
          providerIndex.pageIndex = 0;
        });
      },
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          // App Bar
          AppBarHomePage(),
          CarouselScreen(),

          //
          //  Cool Summer Offer
          //
          CustomGridViewOne(
            decoration: const BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              image: DecorationImage(
                  opacity: 0.1,
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/7a/aa/98/7aaa98f219cf5337932f79117fa6c8dc.jpg'),
                  fit: BoxFit.cover),
              gradient: LinearGradient(colors: [
                Color(0xff7fd2bf),
                Color(0xff6ef0c3),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),

            crossAxisCount: 2,
            height: 450,
            // readJsonData: (data) => SummerCardFunction.Function1(data),
            dataText: 'Special Offer Of Day',
            cardIndex: 3,
          ),
          CustomGridViewTwo(
            color: Color(0xffffe75a),
            cardIndex: 0,
          ),

          CustomGridViewOne(
            crossAxisCount: 2,
            height: 450,
            // readJsonData: (data) => SummerCardFunction.Function1(data),
            dataText: 'Cool Summer Offers',
            cardIndex: 0,
          ),

          CustomGridViewOne(
            decoration: const BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              image: DecorationImage(
                  opacity: 0.17,
                  image: NetworkImage(
                      'https://isorepublic.com/wp-content/uploads/2021/03/iso-republic-pastel-flower-petals-free-stock-photo-1100x733.jpg'),
                  fit: BoxFit.cover),
              gradient: LinearGradient(colors: [
                Color(0xff7f7fd2),
                Color(0xff6e6ef0),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            crossAxisCount: 2,
            height: 550,
            dataText: 'Top Sections',
            cardIndex: 1,
          ),
          CustomGridViewTwo(
            color: Color(0xffd7d5d5),
            cardIndex: 1,
          ),

          CustomGridViewOne(
            decoration: const BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              image: DecorationImage(
                  opacity: 0.17,
                  image: NetworkImage(
                      'https://isorepublic.com/wp-content/uploads/2021/03/iso-republic-pastel-flower-petals-free-stock-photo-1100x733.jpg'),
                  fit: BoxFit.cover),
              gradient: LinearGradient(colors: [
                Color(0xffc8d27d),
                Color(0xfff0f06e),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            crossAxisCount: 2,
            height: 550,
            dataText: 'Best Quality',
            cardIndex: 2,
          ),
        ]),
      ),
    );
  }
}
