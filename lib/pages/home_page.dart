import 'package:first_draft/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:first_draft/models/shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // import categories list. maybe button later
    final categories = categorieslist;
    return Scaffold(

      appBar: AppBar( // APPBAR
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 50,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
            child: Text(
              "Shop Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ),


      body: 
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [

            // SEARCH BAR
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
              ),
            ),
          SizedBox(height: 16), // Space between search bar and grid

            // Subtitle for the grid
            Text(
              "Explore our categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 8), // Space between subtitle and grid
          // GRID
          Expanded(
            child:
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 2 columns
                crossAxisSpacing: 15, // Space between columns
                mainAxisSpacing: 15, // Space between rows
                childAspectRatio: 1, // Adjust item size
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){ },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ Circle ONLY around the icon
                      Container(
                        padding: EdgeInsets.all(12), // Adjust icon padding inside the circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey, // Background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Icon(categories[index].icon, size: 40, color: const Color.fromARGB(255, 58, 58, 58)),
                      ),
                      SizedBox(height: 8), // Space between icon and text
                      Text(
                        categories[index].name,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
          ],
        )
      ),
    
      drawer: MyDrawer(),
    );
  }
}
