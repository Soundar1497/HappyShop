import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/Cart_Provider/cart_Provider.dart';

class CartProductList extends StatefulWidget {
  CartProductList({Key? key, this.cartData}) : super(key: key);

  List? cartData;

  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    var data = widget.cartData;
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 8),
      // color: Colors.red[100],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    height: 100,
                    color: Colors.yellow,
                    width: double.infinity,
                    child: Text("$i"),
                  );
                }),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(.1),
                    offset: Offset(-1, 0),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ]),
            width: double.infinity,
            height: 55,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "600",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'View price details',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                      if (state.contains(MaterialState.pressed)) {
                        return Colors.orange[300];
                      }
                      return Colors.orange[400];
                    })),
                    onPressed: () {
                      setState(() {
                        cartProvider.cartList.clear();
                        print(
                            "${cartProvider.cartList.length} + ${cartProvider.cartList.isEmpty} ");
                      });
                    },
                    child: Text(
                      'Place Order',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ))
                ],
              ),
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.black12,
            thickness: 1.3,
          )
        ],
      ),
    ));
  }
}
