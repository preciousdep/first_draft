import 'package:first_draft/models/post.dart';
import 'package:first_draft/pages/home_page.dart';
import 'package:first_draft/pages/my_cart.dart';
import 'package:first_draft/pages/my_purchases.dart';
import 'package:first_draft/pages/my_wallet.dart';
import 'package:first_draft/pages/post.dart';
import 'package:first_draft/pages/settings.dart';
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
        '/home_page': (context) => HomePage(),
        '/my_cart': (context) => const CartPage(),
        '/my_purchases': (context) => const PurchasesPage(),
        '/my_wallet': (context) => const WalletPage(),
        '/settings': (context) => const Settings(),
      },
  onGenerateRoute: (settings) {
    if (settings.name == '/post_page') {
      final post = settings.arguments as Post;
      return MaterialPageRoute(
        builder: (context) => PostPage(post: post),
      );
    }
    return null; // If route is not found
  },
      
    );
  }
}