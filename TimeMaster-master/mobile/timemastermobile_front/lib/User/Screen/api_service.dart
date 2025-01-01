import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000'; // Remplacez par votre URL backend

  Future<Map<String, dynamic>> fetchUserProfile(String sessionCookie) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': sessionCookie, // Utilisez le cookie de session si nécessaire
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
