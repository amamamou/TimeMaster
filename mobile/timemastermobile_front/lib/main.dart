import 'package:flutter/material.dart';
import 'package:timemastermobile_front/Authentification/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: const Color(0xFF4169E1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0052B4),
          primary: const Color(0xFF4169E1),
        ),
        scaffoldBackgroundColor: const Color(0xFFEFEFFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4169E1), // Login button color
            foregroundColor: Colors.white, // Text color on buttons
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

