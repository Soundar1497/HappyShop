// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:project_1/app/models/authentication_model.dart';
import 'package:project_1/app/ui/pages/auth/firstpage.dart';
import 'package:project_1/app/ui/pages/dashboard/dashboard.dart';

class Authen extends ControllerMVC {
  // create factory instance of _this with null function Authen._()
  factory Authen() => _this ??= Authen._();
  static Authen? _this;
  Authen._();

  final AuthenticationModel _auth = AuthenticationModel();

  bool get brand => AuthenticationModel.brand;

  void brandmall() => AuthenticationModel.brandmall();

  get authenCurrentState => _auth.authCurrentState;

  get navigatorKey => _auth.navigatorKey;

  get signUpKey => _auth.signUpKey;

  get signInKey => _auth.signInKey;

  TextEditingController get name => _auth.name;
  TextEditingController get email => _auth.email;
  TextEditingController get mobile => _auth.mobile;
  TextEditingController get password => _auth.password;
  TextEditingController get confirmPassword => _auth.confirmPassword;

  TextEditingController get inEmail => _auth.inEmail;
  TextEditingController get inPassword => _auth.inPassword;

  Future signUp(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      //sign up

      final mess1 = await _auth.signUp(
          email: _auth.email.text, password: _auth.password.text);

      // registration form

      final mess2 = await _auth.register(
          name: _auth.name.text,
          email: _auth.email.text,
          mobile: _auth.mobile.text,
          password: _auth.password.text);

      if (mess1.contains('success')) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const FirstScreen()),
            (Route route) => false);
      }

      //
      // if (mess1.contains('success') && mess2.contains('success')) {
      //   Navigator.pop(context);
      // }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      var snackbar = SnackBar(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          behavior: SnackBarBehavior.floating,
          content: Text('${e.message}'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  // Sign In function

  Future signIn(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    if (_auth.inEmail.text.contains('@gmail.com')) {
      _auth.inEmail.text = _auth.inEmail.text.trim();
    } else {
      var count = '@gmail.com';
      _auth.inEmail.text = _auth.inEmail.text.trim();
      _auth.inEmail.text = _auth.inEmail.text + count;
    }
    try {
      final messSingIn = await _auth.signIn(
          email: _auth.inEmail.text, password: _auth.inPassword.text);

      if (messSingIn.contains('success')) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Dashboard()),
            (Route route) => false);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 300,
                  height: 150,
                  child: Center(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Text('${e.message}'),
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                String? err = e.message;
                                if (err!.contains('The password is invalid')) {
                                  inPassword.text = '';
                                }
                                if (err.contains('badly formatted')) {
                                  Navigator.pushReplacementNamed(
                                      context, '/signIn');
                                }
                              },
                              child: const Text('close')),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    }
  }

  Future signOut(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await _auth.signOut();

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const FirstScreen()));
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        Text('${e.message}'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard()));
                              // Navigator.pop(context);
                              // Navigator.of(context).popUntil(
                              //         (route) => );
                            },
                            child: const Text('close')),
                      ],
                    ),
                  ),
                ),
              ));
    }
  }
}
