import 'package:flutter/material.dart';

class DrawerUser extends StatelessWidget {
  final String username;
  final String email;

  const DrawerUser({
    super.key,
    required this.username,
    required this.email,
  });

  ListTile listTileWidget(String title, IconData icon, Function() onTapLink) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.red),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          HeaderDrawer(username: username, email: email),
          const SizedBox(height: 20),
          listTileWidget("Check Timetable", Icons.view_timeline_outlined, () {
            Navigator.pop(context); // Navigate to timetable
          }),
          listTileWidget("Discussion", Icons.message_outlined, () {
            Navigator.pop(context); // Navigate to discussion
          }),
          const Spacer(),
          listTileWidget("Logout", Icons.logout, () {
            // Logout functionality
            Navigator.pop(context); // Close drawer
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                );
              },
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  final String username;
  final String email;

  const HeaderDrawer({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40),
      color: const Color.fromRGBO(65, 105, 225, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/persons/rayen.jpg'),
          ),
          const SizedBox(height: 10),
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            email,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
