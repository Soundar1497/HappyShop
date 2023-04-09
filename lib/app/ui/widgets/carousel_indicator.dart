import 'package:flutter/material.dart';

List<Widget> carouselIndicator(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 4),
      width: currentIndex == index ? 16 : 10,
      height: currentIndex == index ? 8 : 10,
      decoration: BoxDecoration(
        borderRadius: currentIndex == index
            ? const BorderRadius.all(Radius.circular(5))
            : null,
        color: currentIndex == index ? Colors.teal.shade400 : Colors.black54,
        shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {},
      ),
    );
  });
}
