import 'package:flutter/material.dart';


class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My Purchases"),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
        ));
  }
}