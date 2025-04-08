import 'package:amplify_flutter/amplify_flutter.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;// List of post IDs linked to this user

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  static Future<User?> getCurrentUserProfile() async {
    try {
      final authUser = await Amplify.Auth.getCurrentUser();
      return User(
        id: authUser.userId,
        name: authUser.username, // Change if using real names
        email: authUser.username,
        profileImage: "default.png", // Placeholder, update later
      );
    } catch (e) {
      return null;
    }
  }
}