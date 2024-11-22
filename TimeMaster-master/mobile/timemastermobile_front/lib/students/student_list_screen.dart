import 'package:flutter/material.dart';
import 'package:timemastermobile_front/students/student.dart';
import 'package:timemastermobile_front/students/student_service.dart';


import 'student_edit_screen.dart'; // Écran d'édition des étudiants

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final StudentService _studentService = StudentService();
  late Future<List<Student>> _students;

  @override
  void initState() {
    super.initState();
    _students = _studentService.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion des Étudiants')),
      body: FutureBuilder<List<Student>>(
        future: _students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun étudiant trouvé'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final student = snapshot.data![index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(student.username[0].toUpperCase()),
                  ),
                  title: Text(student.username),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email : ${student.email}'),
                      if (student.overlappingGroups != null)
                        Text('Groupes : ${student.overlappingGroups}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _studentService.deleteStudent(student.id);
                      setState(() {
                        _students = _studentService.getStudents();
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentEditScreen(student: student),
                      ),
                    ).then((_) => setState(() {
                          _students = _studentService.getStudents();
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
            MaterialPageRoute(builder: (context) => StudentEditScreen()),
          ).then((_) => setState(() {
                _students = _studentService.getStudents();
              }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
