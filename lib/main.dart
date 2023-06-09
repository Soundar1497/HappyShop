import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/pages/auth/firstpage.dart';
import 'package:project_1/app/ui/pages/auth/signin.dart';
import 'package:project_1/app/ui/pages/auth/signup.dart';
import 'package:project_1/app/ui/pages/ui_page_list/home/home.dart';
import 'package:project_1/firebase_options.dart';
import 'package:provider/provider.dart';

import 'app/provider/Provider_main_list.dart';
import 'app/ui/pages/buyers/product_detail_page/mobile_list_detail.dart';
import 'app/ui/pages/buyers/product_list_page/mobile_case_list/mobile_case_list.dart';
import 'app/ui/pages/buyers/product_list_page/mobile_list/mobile_list.dart';
import 'app/ui/pages/buyers/product_list_page/shoe_list/sports_shoe_list.dart';
import 'app/ui/pages/dashboard/dashboard.dart';
import 'app/ui/pages/splash_Screen/splash_screen.dart';
import 'app/ui/pages/ui_page_list/account/add_delivery_address.dart';
import 'app/ui/pages/ui_page_list/account/saved_address_page.dart';
import 'app/ui/pages/ui_page_list/cart/cart.dart';
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
    return MultiProvider(
      providers: providerMainList(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _authen.navigatorKey,
          routes: {
            '/': (context) => const SplashScreen(),
            '/firstScreen': (context) => const FirstScreen(),
            '/signUp': (context) => const SignUpPage(),
            '/signIn': (context) => const SignIn(),
            '/dashboard': (context) => Dashboard(),
            '/cart': (context) => const Cart(),
            '/homePage': (context) => const HomePage(),
            '/Categories': (context) => const Categories(),
            '/SavedAddressPage': (context) => const SavedAddressPage(),
            '/AddDeliveryAddress': (context) => AddDeliveryAddress(
                argument: ModalRoute.of(context)?.settings.arguments
                    as List<dynamic>),
            '/ShortsShoeList': (context) => const SportsShoeList(),
            '/MobileCaseList': (context) => const MobileCaseList(),
            '/MobileList': (context) => const MobileList(),
            '/MobileListDetail': (context) => MobileListDetail(
                ModalRoute.of(context)?.settings.arguments as List<dynamic>),
          }),
    );
  }
}
