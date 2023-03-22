import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationModel {
  FirebaseAuth authenticationAccess = FirebaseAuth.instance;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

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

  static brandmall() {
    _brand = !_brand;
  }

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
    int i = 0;
    var collectionId = await fireStore.collection('User').get();
    var docLength = collectionId.size;
    if (docLength == 0) {
      i = 0;
    } else {
      i = docLength;
    }
    await fireStore.collection('User').doc("user_$i").set(
        {'name': name, 'email': email, 'mobile': mobile, 'password': password});
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

  Future userData() async {
    print("===================================");
    var currentUser = await authenticationAccess.currentUser?.email;
    var collectionId = await fireStore.collection('User').get();
    var docLength = collectionId.size;

    print("document length : $docLength");

    int i = 0;

    for (int j = 0; j < docLength; j++) {
      var docId = await fireStore.collection('User').doc('user_$j').get();
      var savedEmail = docId.data();

      print('document data for j value $j : $savedEmail');
      print('current User Email Id : $currentUser');
      print('active document email Id : ${savedEmail?['email']}');
      if (currentUser == savedEmail?['email']) {
        email.text = savedEmail?['email'];
        name.text = savedEmail?['name'];
        mobile.text = savedEmail?['mobile'];
        password.text = savedEmail?['password'];
        print("........ Data Assign Successfully .........");
        break;
      }
      i++;
    }
  }
}
