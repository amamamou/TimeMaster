import 'package:flutter/material.dart';
import 'drawer_user.dart';

// Simuler une requête API pour récupérer les données utilisateur
Future<Map<String, String>> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2)); // Simuler un délai
  return {
    "username": "test@test.com",
    "email": "janesmith@example.com",
  };
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading user data"));
        } else {
          final data = snapshot.data!;
          return DrawerUser(
            username: data["username"]!,
            email: data["email"]!,
          );
        }
      },
    );
  }
}
