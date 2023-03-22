import 'package:flutter/material.dart';

class EmptyProductPage extends StatefulWidget {
  const EmptyProductPage({Key? key}) : super(key: key);

  @override
  State<EmptyProductPage> createState() => _EmptyProductPageState();
}

class _EmptyProductPageState extends State<EmptyProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
      ),
      body: const Center(
        child: Text("Product Page"),
      ),
    );
  }
}
