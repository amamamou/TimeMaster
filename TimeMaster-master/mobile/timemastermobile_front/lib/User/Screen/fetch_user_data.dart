import 'dart:convert';
import 'package:http/http.dart' as http;

// Fonction pour récupérer les données utilisateur depuis l'API
Future<Map<String, String>> fetchUserData() async {
  final url = Uri.parse('http://localhost:3000/users'); // Remplacez par l'URL de votre API
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return {
      "username": data["username"],
      "email": data["email"],
    };
  } else {
    throw Exception('Failed to load user data');
  }
}
