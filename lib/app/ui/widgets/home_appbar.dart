import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:project_1/app/controllers/authentication.dart';

class AppBarHomePage extends StatefulWidget {
  AppBarHomePage({Key? key}) : super(key: key);

  @override
  State<AppBarHomePage> createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  Authen _authen = Authen();
  @override
  Widget build(BuildContext context) {
    return
        //
        /*
    // return CustomScrollView(slivers: [
    //   SliverAppBar(
    //     shadowColor: Colors.black54,
    //     backgroundColor: Colors.white,
    //     foregroundColor: Color(0xFF41B706),
    //     title: Container(
    //       margin: EdgeInsets.only(right: 20),
    //       child: Text(
    //         "Happy Shopping",
    //         style: TextStyle(
    //             fontSize: 25,
    //             fontStyle: FontStyle.italic,
    //             fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //     leading: Container(
    //       // color: Colors.red,
    //       child: Transform.scale(
    //         scale: 1.8,
    //         child: Image(
    //           image: AssetImage('assets/icon_launcher_foreground.png'),
    //           fit: BoxFit.contain,
    //         ),
    //       ),
    //     ),
    //     floating: true,
    //     pinned: true,
    //     bottom: PreferredSize(
    //         preferredSize: Size(MediaQuery.of(context).size.width, 60),
    //         child: Container(
    //           height: 60,
    //           width: double.infinity,
    //           color: Colors.white,
    //           child: Row(
    //             children: [
    //               //Brand Mall Button
    //               Container(
    //                 width: 50,
    //                 height: 45,
    //                 margin: const EdgeInsets.only(
    //                   left: 10,
    //                 ),
    //                 child: Center(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       const Text(
    //                         'Brand Mall',
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                             fontSize: 9,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black54),
    //                       ),
    //                       FlutterSwitch(
    //                         value: widget.switchPosition,
    //                         onToggle: (bool _value) {
    //                           setState(() {
    //                             widget.switchPosition = _value;
    //                           });
    //                         },
    //                         width: 44,
    //                         height: 16,
    //                         showOnOff: true,
    //                         toggleSize: 16,
    //                         valueFontSize: 11,
    //                         padding: 0.5,
    //                         activeColor: Colors.black87,
    //                         inactiveColor: Colors.grey.shade300,
    //                         activeTextColor: Colors.white,
    //                         activeText: 'ON',
    //                         inactiveTextColor: Colors.black87,
    //                         inactiveText: 'OFF',
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //
    //               //  TextField Box
    //
    //               Container(
    //                 width: 290,
    //                 height: 40,
    //                 margin: const EdgeInsets.only(
    //                   left: 20,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     color: Colors.black12,
    //                     borderRadius: BorderRadius.circular(5),
    //                     border: Border.all(
    //                       color: Colors.black12,
    //                     )),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     InkWell(
    //                       onTap: () {
    //                         debugPrint('Search Bar Pressed');
    //                       },
    //                       child: Row(
    //                         children: [
    //                           const Icon(
    //                             Icons.search_rounded,
    //                             color: Colors.black54,
    //                             size: 28,
    //                           ),
    //                           Container(
    //                             alignment: Alignment.centerLeft,
    //                             width: 180,
    //                             height: 50,
    //                             // color: Colors.red,
    //                             margin: const EdgeInsets.only(
    //                               left: 5,
    //                             ),
    //
    //                             child: const Text(
    //                               'Search for Products',
    //                               style: TextStyle(fontSize: 14),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     InkWell(
    //                       onTap: () {
    //                         debugPrint('Mic Icon Pressed');
    //                       },
    //                       child: const Icon(
    //                         Icons.mic_outlined,
    //                         color: Colors.black54,
    //                         size: 28,
    //                       ),
    //                     ),
    //                     InkWell(
    //                       onTap: () {
    //                         debugPrint('Camera Icon Pressed');
    //                       },
    //                       child: const Icon(
    //                         Icons.camera_alt_outlined,
    //                         color: Colors.black54,
    //                         size: 28,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         )),
    //   )
    // ]);
    */

        //

        //

        SafeArea(
      child: Column(
        children: [
          // Logo and Page Title

          Container(
            height: 50,
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                SizedBox(
                    height: 30,
                    child: Transform.scale(
                      scale: 2,
                      child: const Image(
                          image: AssetImage(
                              'assets/icon_launcher_foreground.png')),
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'HAPPY SHOP',
                  style: TextStyle(
                    color: Color(0xFF6FB403),
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar

          PreferredSize(
              preferredSize: Size.square(90),
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    //Brand Mall Button
                    Container(
                      width: 50,
                      height: 45,
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Brand Mall',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            FlutterSwitch(
                              value: _authen.brand,
                              onToggle: (bool _value) {
                                print(_value);
                                setState(() {
                                  _authen.brandmall();
                                });
                              },
                              width: 44,
                              height: 16,
                              showOnOff: true,
                              toggleSize: 16,
                              valueFontSize: 11,
                              padding: 0.5,
                              activeColor: Colors.black87,
                              inactiveColor: Colors.grey.shade300,
                              activeTextColor: Colors.white,
                              activeText: 'ON',
                              inactiveTextColor: Colors.black87,
                              inactiveText: 'OFF',
                            ),
                          ],
                        ),
                      ),
                    ),

                    //  TextField Box

                    Container(
                      width: 290,
                      height: 40,
                      margin: const EdgeInsets.only(
                        left: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black12,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              debugPrint('Search Bar Pressed');
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search_rounded,
                                  color: Colors.black54,
                                  size: 28,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: 180,
                                  height: 50,
                                  // color: Colors.red,
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                  ),

                                  child: const Text(
                                    'Search for Products',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint('Mic Icon Pressed');
                            },
                            child: const Icon(
                              Icons.mic_outlined,
                              color: Colors.black54,
                              size: 28,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint('Camera Icon Pressed');
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black54,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),

          //  carousel
        ],
      ),
    );
  }
}
