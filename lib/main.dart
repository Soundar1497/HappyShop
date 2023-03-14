import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/pages/auth/firstpage.dart';
import 'package:project_1/app/ui/pages/auth/signin.dart';
import 'package:project_1/app/ui/pages/auth/signup.dart';
import 'package:project_1/firebase_options.dart';

import 'app/ui/pages/splash_Screen/splash_screen.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _authen.navigatorKey,
        routes: {
          '/': (context) => const SplashScreen(),
          '/firstScreen': (context) => const FirstScreen(),
          '/signUp': (context) => const SignUpPage(),
          '/signIn': (context) => const SignIn(),
        });
  }
}
