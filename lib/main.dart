import 'package:first_draft/amplifyconfiguration.dart';
import 'package:first_draft/models/post.dart';
import 'package:first_draft/pages/home_page.dart';
import 'package:first_draft/pages/signup_page.dart';
import 'package:first_draft/pages/my_cart.dart';
import 'package:first_draft/pages/my_purchases.dart';
import 'package:first_draft/pages/my_wallet.dart';
import 'package:first_draft/pages/post.dart';
import 'package:first_draft/pages/settings.dart';
import 'package:first_draft/pages/profile.dart';
import 'package:first_draft/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';



void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    print("Amplify configured successfully");
  } catch (e) {
    print("Error configuring Amplify: $e");
  }
}

Future<bool> checkIfUserIsSignedIn() async {
    try {
      final authUser = await Amplify.Auth.getCurrentUser();
      return true; // User is signed in
    } catch (e) {
      return false; // No user is signed in
    }
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: checkIfUserIsSignedIn(), // Check if the user is signed in
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading spinner while checking
          }
          if (snapshot.hasError || !snapshot.hasData || !snapshot.data!) {
            return SignUpPage(); // Show sign-in page if the user is not signed in
          } else {
            return HomePage(); // Show home page if the user is signed in
          }
        },
      ),
      theme: LightMode,
      routes: {
        '/home_page': (context) => HomePage(),
        '/my_cart': (context) => const CartPage(),
        '/my_purchases': (context) => const PurchasesPage(),
        '/my_wallet': (context) => const WalletPage(),
        '/settings': (context) => const Settings(),
        '/profile': (context) => ProfilePage(),
        '/signup': (context) => SignUpPage(),
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