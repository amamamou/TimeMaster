import 'dart:convert';
import 'package:http/http.dart' as http;
import 'matiere.dart';

class MatiereService {
  final String baseUrl = 'http://192.168.31.104:3000/matieres'; // Remplacez par votre URL de votre hote 

  Future<List<Matiere>> fetchMatieres() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((matiere) => Matiere.fromJson(matiere)).toList();
    } else {
      throw Exception('Failed to load matieres');
    }
  }

  Future<void> addMatiere(Matiere matiere) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(matiere.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add matiere');
    }
  }
}
