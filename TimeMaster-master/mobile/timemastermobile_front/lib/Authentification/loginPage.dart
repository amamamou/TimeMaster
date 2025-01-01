import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the HTTP package
import 'dart:convert'; // For JSON encoding and decoding

class LoginPage extends StatelessWidget {
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  Future<void> _login(BuildContext context) async {
    const String apiUrl = 'http://localhost:3000/users/login';

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "identifier": identifierController.text, // Can be email or username
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Extract the redirect URL from the backend response
        final redirectUrl = responseData['redirectUrl'];

        if (redirectUrl == '/dashboard') {
          Navigator.pushReplacementNamed(context, '/dashboard'); // Admin dashboard
        } else if (redirectUrl == '/') { //a4i tetbadel wa9ta yetbadel el backend
          Navigator.pushReplacementNamed(context, '/dashboardUser'); // User dashboard
        } else {
          _showErrorDialog(context, "Unknown redirect URL");
        }
      } else {
        final responseData = jsonDecode(response.body);
        _showErrorDialog(context, responseData['message'] ?? "Login failed");
      }
    } catch (error) {
      _showErrorDialog(context, "Connection error. Please try again.");
    }
  }

  // Function to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 150.0, 40.0, 40.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('images/Login/login-logo.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'To TimeMaster',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFAE2025),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: identifierController,
                      decoration: const InputDecoration(
                        hintText: 'Email or Username',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _login(context), // Call the login function
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
