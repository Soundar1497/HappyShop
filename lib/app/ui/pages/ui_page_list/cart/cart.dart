import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/Cart_Provider/cart_Provider.dart';
import '../../dashboard/dashboard.dart';
import 'cart_product_list/cart_product_list.dart';
import 'delivery_address_section/addressSelection.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    print("cartList.length : ${cartProvider.cartList.length}");
    for (var element in cartProvider.cartList) {
      if (element[0] == "realme 10 Pro 5G (6GB RAM, 128GB, Hyperspace)") {
        print(
            "cartList specific element index : ${cartProvider.cartList.indexOf(element)}");
        break;
      }
    }

    cartProvider.cartList.forEach((element) {
      print(
          "cartList for each element \n element[${cartProvider.cartList.indexOf(element)}] : ${element[0]}");
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
        title: const Text("My Cart"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic_none_outlined))
        ],
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 25),
            child: Container(
                padding: const EdgeInsets.only(top: 1, bottom: 10),
                child: const Text(
                  '0 items',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ))),
      ),
      body: data.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard(
                                      valueIndex: 1,
                                    )),
                            (Route route) => false);
                      },
                      child: const Text('Shop now'))
                ],
              ),
            )
          : Column(
              children: [
                const AddressSelection(),
                CartProductList(cartData: data),
              ],
            ),
    );
  }
}

List val = [
  {
    "img":
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTN3I7F1uF3_riYQeAvb4J1kbt6e-Z6OjP7tqwnc1zdyKA7sUIPfyYLefcgQX1F53Cw7hpIU_ZtMi1jlpiQ1GqgvC7h4h1kXQ&usqp=CAE",
    "name": "realme 10 Pro 5G (6GB RAM, 128GB, Hyperspace)",
    "rating": "3.5",
    "review": "2000",
    "op": "490",
    "sp": "390",
    "save": "100",
    "shipping": "Free delivery by Tue, 18 Apr"
  },
  {
    "img":
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQACy9vwrHfj_rssNC6gkhXZxazB69M79Erf0ZI7K8Y8MncRDSu6sRhWRbucwTtmq7hos9gFPCkLeO5wnGHZdSupyf_7pdt&usqp=CAE",
    "name": "Realme C33 64 GB (Night Sea, 4 GB RAM)",
    "rating": "3.5",
    "review": "2000",
    "op": "490",
    "sp": "390",
    "save": "100",
    "shipping": "Free delivery by Tue, 18 Apr"
  },
];
