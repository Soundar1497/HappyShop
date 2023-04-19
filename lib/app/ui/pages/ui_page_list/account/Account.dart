import 'package:flutter/material.dart';

import '../../../../controllers/authentication.dart';
import '../../../../models/geo_locator/geo_locator_model.dart';
import '../../../../provider/geolocator_provider/geolocator_provider.dart';
import '../../../widgets/account_card.dart';
import '../../../widgets/circular_icon_button.dart';
import 'edit_profile.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Authen _authSign = Authen();
  GeoLocatorProvider _GeoLocatorProvider = GeoLocatorProvider();
  GeoLocatorModel _GeoLocatorModel = GeoLocatorModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Stack(children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 147, 163, 1.0)
                    // gradient: LinearGradient(colors: [
                    //   SplashColor.splashColor1,
                    //   SplashColor.splashColor5,
                    // ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                    ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1, .3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ], color: Colors.red, shape: BoxShape.circle),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(shape: BoxShape.circle),

                          child: Image.network(
                            "https://i.pinimg.com/236x/6c/37/fe/6c37fee9a4270bc62644187d4237a240.jpg",
                            fit: BoxFit.cover,
                          ),

                          // child: Image.asset(
                          //   "assets/carouselImage/carouselImage_5.jpg",
                          //   fit: BoxFit.cover,
                          // ),
                        )),
                  )),
            ),
            Positioned(
              top: 220,
              left: 220,
              child: CircularIconButton(
                onTap: () {},
                radius: 40,
                icon: Icons.camera_alt_outlined,
                iconColor: const Color.fromRGBO(100, 100, 100, 1),
                iconSize: 24,
                backgroungColor: const Color.fromRGBO(230, 230, 230, 1),
              ),
            ),
            Positioned(
              top: 310,
              child: Column(
                children: [
                  //My Account

                  AccountCard(
                    onTapFunction: () {
                      print("My Account clicked");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EditProfile();
                      }));
                    },
                    label: "My Account",
                    icon: Icons.account_circle_outlined,
                    iconSize: 35,
                  ),

                  //Saved Address

                  AccountCard(
                    onTapFunction: () {
                      print("Saved Addresses Clicked");
                      Navigator.pushNamed(context, "/SavedAddressPage");
                    },
                    label: "Saved Addresses",
                    icon: Icons.add_location_alt,
                    iconSize: 32,
                  ),

                  // Notification

                  AccountCard(
                    onTapFunction: () {
                      print("Notifications clicked");
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const AthenTest();
                      // }));
                    },
                    label: "Notifications",
                    icon: Icons.notifications_outlined,
                    iconSize: 32,
                  ),

                  // Setting

                  AccountCard(
                    onTapFunction: () {
                      print("Settings clicked");
                    },
                    label: "Settings",
                    icon: Icons.settings_outlined,
                    iconSize: 32,
                  ),

                  // Queries

                  AccountCard(
                    onTapFunction: () {
                      print("Browse FAQs clicked");
                    },
                    label: "Browse FAQs",
                    icon: Icons.help_outline_outlined,
                    iconSize: 32,
                  ),

                  // sign out

                  AccountCard(
                      onTapFunction: () {
                        _authSign.signOut(context);
                      },
                      icon: Icons.logout,
                      iconSize: 30,
                      label: "Sign Out"),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// bottom Clipper

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var controlPoint1 = Offset(w * .35, size.height + 50);
    var controlPoint2 = Offset((w * .75), size.height - 70);
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, h - 25)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, w, h - 20)
      ..lineTo(w, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
