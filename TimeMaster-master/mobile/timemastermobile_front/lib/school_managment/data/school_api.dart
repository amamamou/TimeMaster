// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timemastermobile_front/school_managment/data/school_model.dart';
import 'package:timemastermobile_front/config.dart';



class ApiService {
  Future<List<School>> fetchSchools() async {
    final url = Uri.parse('$baseUrl/school/get');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((school) => School.fromJson(school)).toList();
    } else {
      throw Exception('Failed to load schools');
    }
  }

  Future<void> addSchool(String name) async {
    final url = Uri.parse('$baseUrl/school/post');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({'name': name}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add school');
    }
  }
}
