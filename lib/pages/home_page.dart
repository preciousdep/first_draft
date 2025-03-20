import 'package:first_draft/models/post.dart';
import 'package:first_draft/models/post_list.dart';
import 'package:first_draft/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:first_draft/models/category.dart';
import 'package:first_draft/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Post> filteredPosts = postlist; // all posts initially
  List<Category> categories = categorieslist; // categories
  bool isSearching = false; // track if the user is searching to hide categories

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterPosts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterPosts);
    _searchController.dispose();
    super.dispose();
  }

  // search mechanism by filtering
  void _filterPosts() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      isSearching = query.isNotEmpty;

      if (isSearching) {
        filteredPosts = postlist.where((post) {
          return post.title.toLowerCase().contains(query) ||
              post.tags.any((tag) => tag.toLowerCase().contains(query));
        }).toList();
      } else {
        filteredPosts = [];
      }
    });
  }

  // function to filter by category name as a tag
  void _filterByCategory(Category category) {
    setState(() {
      _searchController.clear();
      isSearching = true;
      filteredPosts = postlist.where((post) {
        return post.tags.map((tag) => tag.toLowerCase()).contains(
            category.name.toLowerCase());
      }).toList();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      isSearching = false;
      filteredPosts = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shop Name")),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // SEARCH BAR
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: isSearching
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: _clearSearch,
                      )
                    : Icon(Icons.search),
                suffixIcon: isSearching
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: _clearSearch,
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // CATEGORIES (hidden when isSearching == true)
            if (!isSearching) ...[
              Text(
                "Explore Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _filterByCategory(categories[index]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Icon(categories[index].icon,
                                size: 40, color: Colors.black),
                          ),
                          SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],

            // POSTS (only shown when isSearching == true)
            if (isSearching) ...[
              Text(
                "Search Results",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 posts per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context,
                        '/post_page',
                        arguments: post,
                        );
                      },

                      child: Card(elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🖼 Image (on top)
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                post.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  post.description,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Tags: ${post.tags.join(', ')}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey[600]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "\$${post.price.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),)
                      
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
