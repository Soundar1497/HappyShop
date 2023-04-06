import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../controllers/authentication.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Stack(children: [
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 460,
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
              top: 340,
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
                    iconSize: 40,
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
                    iconSize: 38,
                  ),

                  // Setting

                  AccountCard(
                    onTapFunction: () {
                      print("Settings clicked");
                    },
                    label: "Settings",
                    icon: Icons.settings_outlined,
                    iconSize: 38,
                  ),

                  // Queries

                  AccountCard(
                    onTapFunction: () {
                      print("Browse FAQs clicked");
                    },
                    label: "Browse FAQs",
                    icon: Icons.help_outline_outlined,
                    iconSize: 36,
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
