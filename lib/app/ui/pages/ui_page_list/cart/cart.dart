import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/carousel_control.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final providerIndex = Provider.of<CarouselListener>(context);

    return RefreshIndicator(
      onRefresh: () async {
        print(providerIndex.pageIndex);
        setState(() {
          Navigator.pushReplacementNamed(context, '/dashboard');
          providerIndex.pageIndex = 2;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(245, 147, 163, 1.0),
          title: const Text("Cart"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic_none_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.65,
                child: Image.network(
                    'https://i.pinimg.com/236x/36/4e/27/364e27c4d683325d2930bb2ea26bab4e.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
