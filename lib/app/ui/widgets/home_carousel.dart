import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/controllers/carousel_control.dart';
import 'package:project_1/app/ui/themes/colors.dart';
import 'package:provider/provider.dart';

import 'carousel_indicator.dart';

class CarouselScreen extends StatefulWidget {
  CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

//

/*

class _CarouselScreenState extends State<CarouselScreen> {
  int activePage = 0;

  List images = [
    'assets/carouselImage/carouselImage_1.jpg',
    'assets/carouselImage/carouselImage_2.jpg',
    'assets/carouselImage/carouselImage_3.jpg',
    'assets/carouselImage/carouselImage_4.jpg',
  ];

  late PageController _pageController;


  Future Anima() async {
    for (int i = 0; i <= activePage; i++) {
      if (activePage == images.length) {
        setState(() {
          activePage = 0;
          i = 0;
        });
      }
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        activePage = activePage + 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    Anima();
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: PageView.builder(
                itemCount: images.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() => activePage = page);
                },
                itemBuilder: (context, pagePosition) {
                  bool active = pagePosition == activePage;
                  return slider(images, pagePosition, active);
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageIndicator(images.length, activePage),
          ),
        ),
      ],
    );
  }
}

// Animated container widget
AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          images[pagePosition],
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

// Widget for image animation while sliding carousel
imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);
      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

// Widget for showing image indicator
List<Widget> imageIndicator(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.teal.shade400 : Colors.black26,
        shape: BoxShape.circle,
      ),
    );
  });
}


 */

//

class _CarouselScreenState extends State<CarouselScreen> {
  Authen _authen = Authen();
  List images2 = [
    'assets/carouselImage/carouselImage_11.jpg',
    'assets/carouselImage/carouselImage_12.jpg',
    'assets/carouselImage/carouselImage_5.jpg',
    'assets/carouselImage/carouselImage_6.jpg',
  ];
  List images1 = [
    'assets/carouselImage/carouselImage_1.jpg',
    'assets/carouselImage/carouselImage_2.jpg',
    'assets/carouselImage/carouselImage_3.jpg',
    'assets/carouselImage/carouselImage_4.jpg',
    'assets/carouselImage/carouselImage_5.jpg',
    'assets/carouselImage/carouselImage_6.jpg',
    'assets/carouselImage/carouselImage_7.jpg',
  ];
  CarouselController _controller = CarouselController();
  int active = 0;

  @override
  Widget build(BuildContext context) {
    final providerBool = Provider.of<CarouselListener>(context);

    return Stack(children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            height: providerBool.brandValue ? 150.0 : 250,
            autoPlayCurve: Curves.easeInOutQuad,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 2),
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (i, he) {
              setState(() {
                active = i;
              });
            }),
        items: providerBool.brandValue
            ? images1.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            SplashColor.splashColor1,
                            // SplashColor.splashColor2,
                            // SplashColor.splashColor3,
                            // SplashColor.splashColor4,
                            SplashColor.splashColor5,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                        child: GestureDetector(
                            child: Image.asset(i, fit: BoxFit.cover)));
                  },
                );
              }).toList()
            : images2.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            SplashColor.splashColor1,
                            // SplashColor.splashColor2,
                            // SplashColor.splashColor3,
                            // SplashColor.splashColor4,
                            SplashColor.splashColor5,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                        child: GestureDetector(
                            child: Image.asset(i, fit: BoxFit.fill)));
                  },
                );
              }).toList(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 15,
            width: providerBool.brandValue
                ? 22 * images1.length.toDouble()
                : 22 * images2.length.toDouble(),
            margin: providerBool.brandValue
                ? const EdgeInsets.only(left: 4, right: 5, top: 120)
                : const EdgeInsets.only(left: 4, right: 5, top: 220),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black26,
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselIndicator(
                  providerBool.brandValue ? images1.length : images2.length,
                  active),
            ),
          ),
        ),
      ),
    ]);
  }
}
