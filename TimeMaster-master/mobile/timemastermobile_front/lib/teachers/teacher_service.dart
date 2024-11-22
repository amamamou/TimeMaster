import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timemastermobile_front/teachers/teachers.dart';


class TeacherService {
  static const String baseUrl = 'http://localhost:3000/teachers'; // Changez selon votre backend

  // Récupérer tous les enseignants
  Future<List<Teacher>> getTeachers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Teacher.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des enseignants');
    }
  }

  // Ajouter un nouvel enseignant
  Future<void> addTeacher(Teacher teacher) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(teacher.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erreur lors de l\'ajout de l\'enseignant');
    }
  }

  // Mettre à jour un enseignant
  Future<void> updateTeacher(int id, Teacher teacher) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(teacher.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la mise à jour de l\'enseignant');
    }
  }

  // Supprimer un enseignant
  Future<void> deleteTeacher(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la suppression de l\'enseignant');
    }
  }
}
