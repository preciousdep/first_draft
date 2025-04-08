import 'package:first_draft/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:first_draft/providers/authservice.dart'; 

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    await _authService.signUp(email, password); // Call signUp from AuthService
    // After a successful sign-in or sign-up
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
);

    // Optionally, show a success message or navigate to another page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
