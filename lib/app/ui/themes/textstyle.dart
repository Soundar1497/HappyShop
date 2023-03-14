import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle? h1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87);
  }

  static TextStyle? p1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(.7));
  }

  static TextStyle? p2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(.7));
  }

  static TextStyle? hl1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff0883ee));
  }

  static TextStyle? hl2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff0883ee));
  }
}
