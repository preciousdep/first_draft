import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My Cart"),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
        ));
  }
}