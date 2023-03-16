import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextStyle {
  // grid view one
  static TextStyle? h1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87);
  }

  static TextStyle? p1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withOpacity(.7));
  }

  static TextStyle? p2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withOpacity(.7));
  }

  static TextStyle? hl1(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff0883ee));
  }

  static TextStyle? hl2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff0883ee));
  }

  // grid view two

  static TextStyle? h2(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87);
  }

  static TextStyle? hl5(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black87);
  }

  static TextStyle? p3(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.lineThrough,
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withOpacity(.6));
  }

  static TextStyle? p4(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withOpacity(.6));
  }

  static TextStyle? hl3(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        overflow: TextOverflow.ellipsis,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff00c000));
  }

  static TextStyle? hl4(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
        color: Colors.white.withAlpha(240));
  }

  static TextStyle? h3(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        // decoration: TextDecoration.lineThrough,
        overflow: TextOverflow.ellipsis,
        color: Colors.black.withOpacity(.8));
  }
}
