import 'package:flutter/material.dart';
import 'package:first_draft/models/post.dart';

class PostPage extends StatelessWidget {
  final Post post;

  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // go back to last page
        ),
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 Image (Top)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                post.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 500, 
              ),
            ),
            SizedBox(height: 8),

            // title of post MODIFY LATER
            Text(
              post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),

            // description
            Text(
              post.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 8),

            // tags
            Text(
              "Tags: ${post.tags.join(', ')}",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),

            // price
            Text(
              "\$${post.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(height: 16),

            // add to cart button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // add to cart logic (implement later)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${post.title} added to cart!")),
                  );
                },
                icon: Icon(Icons.shopping_cart),
                label: Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
