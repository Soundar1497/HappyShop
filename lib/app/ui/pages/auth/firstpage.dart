import 'package:flutter/material.dart';
import 'package:project_1/app/ui/pages/auth/signin.dart';
import 'package:project_1/app/ui/pages/auth/signup.dart';
import 'package:project_1/app/ui/themes/colors.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var atime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (atime == null || now.difference(atime) > Duration(seconds: 1)) {
          //add duration of press gap
          atime = now;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                  'Press Again to Exit'))); //scaffold message, you can show Toast message too.
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              width: 400,
              height: 900,
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Color(0x1A2B2C2B),
              ),
              // borderRadius: const BorderRadius.vertical(
              //     top: Radius.circular(38), bottom: Radius.circular(20)),
              // border: Border.all(width: 1, color: Colors.black)),
              child: Column(children: [
                SafeArea(
                  child: Container(
                    width: 400,
                    height: 300,
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        SplashColor.splashColor1,
                        SplashColor.splashColor5,
                      ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(80)),

                      // Logo Image

                      // image: DecorationImage(
                      //     fit: BoxFit.fitWidth,
                      //     filterQuality: FilterQuality.high,
                      //     image:
                      //         AssetImage('assets/icon_launcher_foreground.png')),

                      //Logo Image
                      color: Color(0xffffffff),
                    ),
                    child: Center(
                      child: Text(
                        'Happy   Shop',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white54.withOpacity(.5),
                            shadows: [
                              Shadow(
                                  color: Colors.black45.withOpacity(.2),
                                  offset: const Offset(1, 1),
                                  blurRadius: 3)
                            ]),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 30),
                  width: 350,
                  child: Text(
                    'Discover Sparkling Product Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'itim',
                      fontSize: 38,
                      color: Colors.black87.withOpacity(.6),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Explore all the most exiting Products based on your interest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'itim',
                        fontSize: 20,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        margin: const EdgeInsets.only(left: 50),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              SplashColor.splashColor1,
                              SplashColor.splashColor5,
                            ]),
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(30)),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ))),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white60;
                                }
                                return Colors.black87;
                              }),
                              overlayColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.lightBlueAccent.withAlpha(50);
                                }
                                return Colors.white60.withAlpha(50);
                              }),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUpPage();
                              }));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(.8)),
                            )),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        margin: const EdgeInsets.only(right: 50),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              SplashColor.splashColor5,
                              SplashColor.splashColor1,
                            ]),
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(30)),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ))),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white60;
                                }
                                return Colors.black87;
                              }),
                              overlayColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.lightBlueAccent.withAlpha(50);
                                }
                                return Colors.white60;
                              }),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignIn();
                              }));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.8)),
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
