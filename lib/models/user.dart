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
}