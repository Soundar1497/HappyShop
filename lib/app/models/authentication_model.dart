import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationModel {
  final FirebaseAuth authenticationAccess = FirebaseAuth.instance;
  final FirebaseFirestore _user = FirebaseFirestore.instance;

  User? get currentUser => authenticationAccess.currentUser!;
  Stream<User?> get authCurrentState => authenticationAccess.authStateChanges();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController inEmail = TextEditingController();
  TextEditingController inPassword = TextEditingController();

  final signUpKey = GlobalKey<FormState>();

  final signInKey = GlobalKey<FormState>();

  static bool _brand = false;

  static bool get brand => _brand;

  static brandmall() => _brand = !_brand;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static String home = '/';
  static String firstPage = '/firstPage';
  String get homePage => home;

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    await authenticationAccess.createUserWithEmailAndPassword(
        email: email, password: password);
    return 'success';
  }

  Future<String> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    await _user.collection(email).add({
      'user_name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
    });
    return 'success';
  }

  // Sign In function

  Future signIn({
    required String email,
    required String password,
  }) async {
    await authenticationAccess.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return 'success';
  }

  Future signOut() async {
    await authenticationAccess.signOut();
  }
}
