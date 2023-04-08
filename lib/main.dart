import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/pages/auth/firstpage.dart';
import 'package:project_1/app/ui/pages/auth/signin.dart';
import 'package:project_1/app/ui/pages/auth/signup.dart';
import 'package:project_1/app/ui/pages/ui_page_list/home/home.dart';
import 'package:project_1/firebase_options.dart';

import 'app/ui/pages/buyers/product_list_page/mobile_case_list/mobile_case_list.dart';
import 'app/ui/pages/buyers/product_list_page/shoe_list/sports_shoe_list.dart';
import 'app/ui/pages/dashboard/dashboard.dart';
import 'app/ui/pages/splash_Screen/splash_screen.dart';
import 'app/ui/pages/ui_page_list/categories/categories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Authen _authen = Authen();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _authen.navigatorKey,
        routes: {
          '/': (context) => const SplashScreen(),
          '/firstScreen': (context) => const FirstScreen(),
          '/signUp': (context) => const SignUpPage(),
          '/signIn': (context) => const SignIn(),
          '/dashboard': (context) => const Dashboard(),
          '/homePage': (context) => const HomePage(),
          '/Categories': (context) => const Categories(),
          '/ShortsShoeList': (context) => const SportsShoeList(),
          '/MobileCaseList': (context) => const MobileCaseList(),
        });
  }
}
