import 'package:flutter/material.dart';

class CircularIconButton extends StatefulWidget {
  const CircularIconButton({
    Key? key,
    required this.onTap,
    required this.radius,
    required this.icon,
    required this.iconSize,
    this.padding,
    this.iconColor,
    required this.backgroungColor,
    this.shadowColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final double radius;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final Color backgroungColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;

  @override
  State<CircularIconButton> createState() => _CircularIconButtonState();
}

class _CircularIconButtonState extends State<CircularIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: widget.backgroungColor,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.black26,
              customBorder: const CircleBorder(),
              onTap: widget.onTap,
              child: Container(
                height: widget.radius,
                width: widget.radius,
                // decoration: ShapeDecoration(
                //   shadows: [
                //     BoxShadow(
                //         color:
                //             widget.shadowColor ?? Colors.grey.withOpacity(.5),
                //         offset: const Offset(.5, 2),
                //         blurRadius: 2)
                //   ],
                //   shape: const CircleBorder(),
                //   color: Colors.transparent,
                // ),
                child: Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: widget.iconColor ?? Colors.black87,
                ),
              ),
            ),
          ),
        ));
  }
}
