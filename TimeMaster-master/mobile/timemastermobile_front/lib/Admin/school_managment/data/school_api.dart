import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timemastermobile_front/Admin/school_managment/data/school_model.dart';
import 'package:timemastermobile_front/config.dart';

class ApiService {
  /// Fetches the list of schools from the backend.
  Future<List<School>> fetchSchools() async {
    final url = Uri.parse('$baseUrl/establishments');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((school) => School.fromJson(school)).toList();
    } else {
      throw Exception('Failed to load schools 💻');
    }
  }

  /// Adds a new school with full details: name, address, phone, and email.
  Future<void> addSchool({
    required String name,
    required String address,
    required String phone,
    required String email,
  }) async {
    final url = Uri.parse('$baseUrl/establishments');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'name': name,
        'address': address,
        'phone': phone,
        'email': email,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add school');
    }
  }

  Future<void> deleteSchool(int id) async {
  final url = Uri.parse('$baseUrl/establishments/$id');
  final response = await http.delete(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to delete school');
  }
}

Future<void> updateSchool(int id, String name, String address, String phone, String email) async {
  final url = Uri.parse('$baseUrl/establishments/$id');
  final response = await http.put(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update school');
  }
}




}
