import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the HTTP package
import 'dart:convert'; // For JSON encoding and decoding
import 'package:timemastermobile_front/Screens/tabs_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    // Replace this with your actual backend URL
    const String apiUrl =
        'http://10.0.2.2:3000/api/login'; // Update with your computer's IP address for physical devices

    try {
      // Send a POST request with the username and password
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "password": passwordController.text,
        }),
      );

      // Check if login was successful
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['message'] == 'Login successful') {
          // Update based on your backend response
          // Navigate to TabBarScreen if login is successful
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TabBarScreen()),
          );
        } else {
          // Show error message if login failed
          _showErrorDialog(context, responseData['message']);
        }
      } else {
        // Show error message if server did not return a 200 status
        _showErrorDialog(context, "Server error. Please try again.");
      }
    } catch (error) {
      print('Error: $error'); // Log the error for debugging
      _showErrorDialog(context, "Connection error. Please try again.$error");
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
          // Main login content
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 150.0, 40.0, 40.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('images/login/login-logo.png', height: 100),
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
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
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
                      onPressed: () {
                        _login(context); // Call the login function
                      },
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
