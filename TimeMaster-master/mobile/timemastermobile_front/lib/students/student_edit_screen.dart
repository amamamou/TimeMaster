import 'package:flutter/material.dart';
import 'package:timemastermobile_front/students/student.dart';
import 'package:timemastermobile_front/students/student_service.dart';


class StudentEditScreen extends StatefulWidget {
  final Student? student;

  StudentEditScreen({this.student});

  @override
  _StudentEditScreenState createState() => _StudentEditScreenState();
}

class _StudentEditScreenState extends State<StudentEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _overlappingGroups, _password, _role;
  final StudentService _studentService = StudentService();

  @override
  void initState() {
    super.initState();
    // Initialisation des champs avec les données de l'étudiant ou des valeurs par défaut
    _username = widget.student?.username ?? '';
    _email = widget.student?.email ?? '';
    _overlappingGroups = widget.student?.overlappingGroups ?? '';
    _password = widget.student?.password ?? ''; // Champ mot de passe
    _role = widget.student?.role ?? 'Élève'; // Valeur par défaut pour le rôle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Ajouter un étudiant' : 'Modifier un étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Champ Nom d'utilisateur
              TextFormField(
                initialValue: _username,
                decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le nom d\'utilisateur est obligatoire.';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              // Champ Email
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'L\'email est obligatoire.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Veuillez entrer un email valide.';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              // Champ Mot de passe
              TextFormField(
                initialValue: _password,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true, // Cacher le texte du mot de passe
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le mot de passe est obligatoire.';
                  }
                  if (value.length < 6) {
                    return 'Le mot de passe doit comporter au moins 6 caractères.';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              // Champ Rôle (dropdown)
              DropdownButtonFormField<String>(
                value: _role,
                decoration: InputDecoration(labelText: 'Rôle'),
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                },
                items: <String>['Élève', 'Professeur', 'Administrateur']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le rôle est obligatoire.';
                  }
                  return null;
                },
              ),
              // Champ Groupes chevauchants
              TextFormField(
                initialValue: _overlappingGroups,
                decoration: InputDecoration(labelText: 'Groupes Chevauchants'),
                onSaved: (value) => _overlappingGroups = value ?? '',
              ),
              SizedBox(height: 20),
              // Bouton de soumission
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newStudent = Student(
                      id: widget.student?.id ?? 0,
                      username: _username,
                      email: _email,
                      password: _password,
                      role: _role, // Ajout du rôle
                      overlappingGroups: _overlappingGroups,
                    );
                    if (widget.student == null) {
                      // Ajouter un nouvel étudiant
                      await _studentService.addStudent(newStudent);
                    } else {
                      // Modifier un étudiant existant
                      await _studentService.updateStudent(widget.student!.id, newStudent);
                    }
                    Navigator.pop(context); // Retourner à l'écran précédent
                  }
                },
                child: Text(widget.student == null ? 'Ajouter' : 'Modifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
