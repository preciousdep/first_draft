import 'package:flutter/material.dart';
import 'package:first_draft/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // drawer head: logo
            Column(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                    Center(
                      child: Icon(Icons.person,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary),
                    ),

                    SizedBox(height:8),

                    Text('Username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ))
                  ],
                  )
                ),

                const SizedBox(
                  height: 25,
                ),
                // shop tile
                MyListTile(
                    text: "Shop",
                    icon: Icons.home,
                    onTap: () => Navigator.pushNamed(context, '/home_page')),

                // cart tile

                MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/my_cart');
                  },
                  
                ),
                  // my purchases
                MyListTile(
                  text: "My Purchases",
                  icon: Icons.gif_box,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/my_purchases');
                  }, 
                ),

                  // wallet
                MyListTile(
                  text: "My Wallet",
                  icon: Icons.wallet,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/my_wallet');
                  },
                ),
                
                  // settings
                MyListTile(
                  text: "Settings",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings');
                  },
                )

                              ],
            ),

            // exit shop tile

            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Column(
                children: [

                  MyListTile(
                    text: "Exit",
                    icon: Icons.logout,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/intro_page', (route) => false);
                    },
                  ),

                  MyListTile(
                  text: "About",
                  icon: Icons.info,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ],
              ),
            )
          ],
        ));
  }
}