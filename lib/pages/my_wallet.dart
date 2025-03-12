import 'package:flutter/material.dart';


class WalletPage extends StatelessWidget {
  const WalletPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("My Wallet"),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
        ));
  }
}