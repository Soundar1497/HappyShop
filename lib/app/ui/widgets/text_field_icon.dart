import 'package:flutter/material.dart';

class TextFieldIcon extends StatefulWidget {
  const TextFieldIcon(
      {Key? key,
      required this.icons,
      required this.obscureText,
      this.passwordVisible})
      : super(key: key);
  final IconData icons;
  final bool? obscureText;
  final bool? passwordVisible;

  @override
  State<TextFieldIcon> createState() => _TextFieldIconState();
}

class _TextFieldIconState extends State<TextFieldIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icons,
      color: widget.obscureText == false && widget.passwordVisible == false
          ? Colors.black.withOpacity(1).withAlpha(105)
          : widget.obscureText == true && widget.passwordVisible == false
              ? Colors.black.withOpacity(1).withAlpha(105)
              : Colors.black.withOpacity(1).withAlpha(150),
    );
  }
}
