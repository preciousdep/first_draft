class Post {
  final String title;
  final String description;
  final double price;
  final List<String> tags;
  final String userId;
  final String image;

  Post({
    required this.title,
    required this.description,
    required this.price,
    required this.tags,
    required this.userId,
    required this.image,
  });
}
