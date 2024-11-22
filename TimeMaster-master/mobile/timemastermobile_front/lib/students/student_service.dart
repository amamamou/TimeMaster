import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timemastermobile_front/students/student.dart';


class StudentService {
  static const String baseUrl = 'http://localhost:3000/students'; // Changez selon votre backend

  // Récupérer tous les étudiants
  Future<List<Student>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des étudiants');
    }
  }

  // Ajouter un nouvel étudiant
  Future<void> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erreur lors de l\'ajout de l\'étudiant');
    }
  }

  // Mettre à jour un étudiant
  Future<void> updateStudent(int id, Student student) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la mise à jour de l\'étudiant');
    }
  }

  // Supprimer un étudiant
  Future<void> deleteStudent(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la suppression de l\'étudiant');
    }
  }
}
