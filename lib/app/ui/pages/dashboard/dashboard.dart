import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/authentication.dart';
import '../../../controllers/carousel_control.dart';
import '../../../controllers/filter_bar_control/sortby_contorl.dart';
import '../ui_page_list/account/Account.dart';
import '../ui_page_list/cart/cart.dart';
import '../ui_page_list/categories/categories.dart';
import '../ui_page_list/home/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Authen _auth = Authen();

  CarouselListener _listener = CarouselListener();

  // late int _index;

  final List<Widget> _mainview = <Widget>[
    const HomePage(),
    const Categories(),
    const Cart(),
    const Account(),
  ];

  void value(index) {
    setState(() {
      _listener.pageIndex = index;
    });
  }

  Authen _authen = Authen();
  SortByControl _sortByControl = SortByControl();

  void deleteSortData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      (prefs.remove('SortPoint'));
      print('SharedPreferences Data Delete');
    });
  }

  @override
  void initState() {
    super.initState();
    deleteSortData();
    // _index = _listener.pageIndex;
    _authen.userData;
    _sortByControl.getSortByData;
    print(_authen.email.text);
  }

  var ctime;

  @override
  Widget build(BuildContext context) {
    // old sample

    /*
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }

   */

// new page

    // LIST OF PAGE
    // {
    //   Widget child;
    //   child = _mainview[_index];
    //   switch (_index) {
    //     case 0:
    //       child = _mainview[0];
    //       break;
    //     case 1:
    //       child = _mainview[1];
    //       break;
    //     case 2:
    //       child = _mainview[2];
    //       break;
    //     case 3:
    //       child = _mainview[3];
    //       break;
    //   }
    return ChangeNotifierProvider<CarouselListener>(
      create: (context) => CarouselListener(),
      child: WillPopScope(
        onWillPop: () {
          if (_listener.pageIndex == 0) {
            DateTime now = DateTime.now();
            if (ctime == null || now.difference(ctime) > Duration(seconds: 1)) {
              //add duration of press gap
              ctime = now;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(
                      'Press Back Button Again to Exit'))); //scaffold message, you can show Toast message too.
              return Future.value(false);
            }

            return Future.value(true);
          } else {
            setState(() {
              _listener.pageIndex = 0;
            });
            return Future.value(false);
          }
        },
        child: Scaffold(
            // Main Bottom Navigation Bar
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.blueAccent,
              elevation: 35,
              type: BottomNavigationBarType.fixed,
              currentIndex: _listener.pageIndex,
              unselectedItemColor: Colors.black54,
              iconSize: 26,
              unselectedLabelStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
              selectedFontSize: 12,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  backgroundColor: Colors.white70,
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Categories',
                  icon: Icon(Icons.category_outlined),
                ),
                // BottomNavigationBarItem(
                //   label: 'Notifications',
                //   icon: Icon(Icons.notifications_outlined),
                // ),
                BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Account',
                  icon: Icon(Icons.account_circle_outlined),
                ),
              ],
              onTap: value,
            ),
            body: SizedBox(child: _mainview[_listener.pageIndex])),
      ),
    );
  }
}
