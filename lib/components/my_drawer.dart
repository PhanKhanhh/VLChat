import 'package:flutter/material.dart';
import 'package:simplechatvlu/services/auth/auth_service.dart';
import 'package:simplechatvlu/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // Implement logout logic here, e.g., FirebaseAuth.instance.signOut();
    // After logging out, you might want to navigate back to the login page
    final AuthService authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),

              //home list
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
              // setting list
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer

                    // Navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SettingsPage(), // Replace with your settings page
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          //logout list
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: () {
                logout(); // Call the logout function
                Navigator.pop(context); // Close the drawer
              },
            ),
          ),
        ],

        //logout button
      ),
    );
  }
}
