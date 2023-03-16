import 'package:flutter/material.dart';
import 'package:project_1/app/ui/pages/buyers/home/home.dart';

import '../buyers/account/Account.dart';
import '../buyers/cart/dart.dart';
import '../buyers/categories/categories.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Authen _auth = Authen();

  int _index = 0;

  final List<Widget> _mainview = <Widget>[
    const HomePage(),
    const Categories(),
    const Cart(),
    const Account(),
  ];

  void _value(index) {
    setState(() {
      _index = index;
    });
  }

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

    return Scaffold(
        // Main Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blueAccent,
          elevation: 35,
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
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
          onTap: _value,
        ),
        body: SizedBox(child: _mainview[_index]));
  }
}
