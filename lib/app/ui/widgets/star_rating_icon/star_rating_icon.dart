import 'package:flutter/material.dart';

class StarRatingIcon extends StatefulWidget {
  StarRatingIcon({Key? key, required this.size, required this.ratingValue})
      : super(key: key);

  double size;

  double? ratingValue;

  @override
  State<StarRatingIcon> createState() => _StarRatingIconState();
}

class _StarRatingIconState extends State<StarRatingIcon> {
  @override
  Widget build(BuildContext context) {
    var ratingValue = widget.ratingValue;
    return ClipPath(
      clipper: MyClipper(),
      child: Stack(children: [
        Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(color: Colors.blue.withOpacity(.2)),
        ),
        Container(
          height: widget.size,
          width: (ratingValue! * widget.size),
          // width: (16),
          decoration: const BoxDecoration(color: Colors.green),
        ),
      ]),
    );
  }
}

// clipper class

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    Path path = Path()
      ..moveTo(w / 2, 0)
      ..lineTo(w / 2.6, h / 3)
      ..lineTo(0, h / 3)
      ..lineTo(w / 3, h / 1.6)
      ..lineTo(0, h)
      ..lineTo(w / 2, h / 1.2)
      ..lineTo(w, h)
      ..lineTo(w / 1.4, h / 1.6)
      ..lineTo(w, h / 3)
      ..lineTo(w / 1.4, h / 3)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
