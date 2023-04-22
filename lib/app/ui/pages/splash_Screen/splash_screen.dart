// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/pages/auth/firstpage.dart';
import 'package:project_1/app/ui/pages/dashboard/dashboard.dart';

import '../../themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _imageAnimation;

  final Authen _authen = Authen();

  void animateImage() {
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _imageAnimation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(_imageController);
    _imageController.forward();
  }

  _navtofirst() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    // await Future.delayed(const Duration(milliseconds: 0), () {});

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => StreamBuilder(
                stream: _authen.authenCurrentState,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Dashboard();
                  } else {
                    return const FirstScreen();
                  }
                })));
  }

  @override
  void initState() {
    super.initState();
    animateImage();
    _navtofirst();
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(children: [
          // Background color for splash screen

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                SplashColor.splashColor1,
                // SplashColor.splashColor2,
                // SplashColor.splashColor3,
                // SplashColor.splashColor4,
                SplashColor.splashColor5,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
          ),

          // App Logo with Animation

          RotationTransition(
            turns: _imageAnimation,
            child: ScaleTransition(
              scale: _imageAnimation,
              child: Center(
                child: Container(
                  height: 150,
                  // color: Colors.red,
                  child: const ClipRect(
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                        image:
                            AssetImage('assets/shopping-bag.png')),
                  ),
                ),
              ),
            ),
          ),

          // App Text with Animation
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - 125),
              // color: Colors.blue,
              child: DefaultTextStyle(
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    WavyAnimatedText('Happy Shop',
                        speed: const Duration(milliseconds: 250)),
                  ],
                ),
              ),
            ),
          ),

          //  logo and text;
        ]),
      ),
    );
  }
}
