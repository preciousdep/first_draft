import 'package:flutter/material.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Settings"),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
        ));
  }
}