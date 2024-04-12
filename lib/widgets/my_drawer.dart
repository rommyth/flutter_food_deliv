import 'package:flu_5_food_delivery/pages/settings_page.dart';
import 'package:flu_5_food_delivery/widgets/my_drawer_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            // app logo
            Icon(Icons.lock_open_rounded,
                size: 80, color: Theme.of(context).colorScheme.inversePrimary),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            // home list tile
            MyDrawerTile(
                text: 'H O M E',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                }),

            // settings list tile
            MyDrawerTile(
                text: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()));
                }),

            const Spacer(),

            //logout list tile
            MyDrawerTile(text: 'L O G O U T', icon: Icons.logout, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
