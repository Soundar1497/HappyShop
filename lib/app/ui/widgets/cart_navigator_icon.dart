import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/Cart_Provider/cart_Provider.dart';
import '../pages/dashboard/dashboard.dart';

class CartNavigatorIcon extends StatefulWidget {
  CartNavigatorIcon({
    Key? key,
    required this.isNavigate,
  }) : super(key: key);
  bool isNavigate;

  @override
  State<CartNavigatorIcon> createState() => _CartNavigatorIconState();
}

class _CartNavigatorIconState extends State<CartNavigatorIcon> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Badge(
        isLabelVisible: cartProvider.cartLength != 0 ? true : false,
        label: cartProvider.cartLength != 0
            ? Text('${cartProvider.cartLength}')
            : const Text(''),
        child: IconButton(
            splashRadius: 35,
            onPressed: () {
              widget.isNavigate
                  ?
                  
                  
                   Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(
                                valueIndex: 2,
                              )),
                      (Route route) => false)


                      
                  : null;
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ),
    );
  }
}

class CartNavigatorIcon1 extends StatefulWidget {
  CartNavigatorIcon1({Key? key, required this.isVisible}) : super(key: key);
  bool isVisible;

  @override
  State<CartNavigatorIcon1> createState() => _CartNavigatorIcon1State();
}

class _CartNavigatorIcon1State extends State<CartNavigatorIcon1> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Badge(
      isLabelVisible: widget.isVisible,
      backgroundColor:
          cartProvider.cartLength != 0 ? Colors.redAccent : Colors.transparent,
      label: cartProvider.cartLength != 0
          ? Text(
              '${cartProvider.cartLength}',
              style: TextStyle(fontSize: 8),
            )
          : const Text(''),
    );
  }
}
