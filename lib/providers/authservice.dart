import 'package:amplify_flutter/amplify_flutter.dart';

class AuthService {
  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      final signUpResult = await Amplify.Auth.signUp(
        username: email,
        password: password,
      );
      if (signUpResult.isSignUpComplete) {
        print("Sign-up successful!");
      } else {
        print("Sign-up not complete yet.");
      }
    } catch (e) {
      print("Sign-up failed: $e");
    }
  }

  // Confirm the sign-up process (usually with a confirmation code from the user's email)
  Future<void> confirmSignUp(String email, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
      print("User confirmed successfully");
    } catch (e) {
      print("Confirmation failed: $e");
    }
  }

  // Sign-in method
  Future<void> signIn(String email, String password) async {
    try {
      final signInResult = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      if (signInResult.isSignedIn) {
        print("Sign-in successful!");
      } else {
        print("Sign-in failed!");
      }
    } catch (e) {
      print("Sign-in failed: $e");
    }
  }

  // Get current logged-in user
  Future<void> getCurrentUser() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      print("Current user: ${user.username}");
    } catch (e) {
      print("No user is signed in.");
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Sign-out failed: $e");
    }
  }
}
