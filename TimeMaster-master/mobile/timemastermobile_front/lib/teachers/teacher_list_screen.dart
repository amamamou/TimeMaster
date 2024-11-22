import 'package:flutter/material.dart';

import 'package:timemastermobile_front/teachers/teacher_service.dart';
import 'package:timemastermobile_front/teachers/teachers.dart';

import 'teacher_edit_screen.dart'; // Écran d'édition des enseignants

class TeacherListScreen extends StatefulWidget {
  @override
  _TeacherListScreenState createState() => _TeacherListScreenState();
}

class _TeacherListScreenState extends State<TeacherListScreen> {
  final TeacherService _teacherService = TeacherService();
  late Future<List<Teacher>> _teachers;

  @override
  void initState() {
    super.initState();
    _teachers = _teacherService.getTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion des Enseignants')),
      body: FutureBuilder<List<Teacher>>(
        future: _teachers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun enseignant trouvé'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final teacher = snapshot.data![index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(teacher.username[0].toUpperCase()),
                  ),
                  title: Text(teacher.username),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email : ${teacher.email}'),
                      Text('Spécialisation : ${teacher.subjectSpecialization}'),
                      Text('Disponibilité : ${teacher.availability}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _teacherService.deleteTeacher(teacher.id);
                      setState(() {
                        _teachers = _teacherService.getTeachers();
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TeacherEditScreen(teacher: teacher),
                      ),
                    ).then((_) => setState(() {
                          _teachers = _teacherService.getTeachers();
                        }));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeacherEditScreen()),
          ).then((_) => setState(() {
                _teachers = _teacherService.getTeachers();
              }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
