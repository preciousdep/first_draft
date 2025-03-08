import 'package:first_draft/pages/home_page.dart';
import 'package:first_draft/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: LightMode,
      routes: {
        '/home_page': (context) => const HomePage(),
        
      }
      
    );
  }
}