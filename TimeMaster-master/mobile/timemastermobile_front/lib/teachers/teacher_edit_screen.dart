import 'package:flutter/material.dart';
import 'package:timemastermobile_front/teachers/teacher_service.dart';
import 'package:timemastermobile_front/teachers/teachers.dart';

class TeacherEditScreen extends StatefulWidget {
  final Teacher? teacher;

  TeacherEditScreen({this.teacher});

  @override
  _TeacherEditScreenState createState() => _TeacherEditScreenState();
}

class _TeacherEditScreenState extends State<TeacherEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password, _role, _subjectSpecialization, _availability, _assignedActivities;

  late int _maxDaysPerWeek, _maxHoursPerDay, _maxGapsPerDay;

  final TeacherService _teacherService = TeacherService();

  @override
  void initState() {
    super.initState();

    // Initialisation des champs avec les données de l'enseignant ou des valeurs par défaut
    _username = widget.teacher?.username ?? '';
    _email = widget.teacher?.email ?? '';
    _password = widget.teacher?.password ?? '';
    _role = widget.teacher?.role ?? 'Professeur'; // Valeur par défaut
    _subjectSpecialization = widget.teacher?.subjectSpecialization ?? '';
    _availability = widget.teacher?.availability ?? '';
    _assignedActivities = widget.teacher?.assignedActivities ?? '';
    _maxDaysPerWeek = widget.teacher?.maxDaysPerWeek ?? 5;
    _maxHoursPerDay = widget.teacher?.maxHoursPerDay ?? 8;
    _maxGapsPerDay = widget.teacher?.maxGapsPerDay ?? 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teacher == null ? 'Ajouter un enseignant' : 'Modifier un enseignant'),
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
                obscureText: true,
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
              // Champ Rôle
              DropdownButtonFormField<String>(
                value: _role,
                decoration: InputDecoration(labelText: 'Rôle'),
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                },
                items: <String>['Professeur', 'Administrateur']
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
              // Champ Spécialisations
              TextFormField(
                initialValue: _subjectSpecialization,
                decoration: InputDecoration(labelText: 'Spécialisations '),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer au moins une spécialisation.';
                  }
                  return null;
                },
                onSaved: (value) => _subjectSpecialization = value!,
              ),
              // Champ Disponibilité
              TextFormField(
                initialValue: _availability,
                decoration: InputDecoration(labelText: 'Disponibilités '),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer au moins une disponibilité.';
                  }
                  return null;
                },
                onSaved: (value) => _availability = value!,
              ),
              // Champ Activités assignées
              TextFormField(
                initialValue: _assignedActivities,
                decoration: InputDecoration(labelText: 'Activités assignées '),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer au moins une activité assignée.';
                  }
                  return null;
                },
                onSaved: (value) => _assignedActivities = value!,
              ),
              // Champ Jours max par semaine
              TextFormField(
                initialValue: _maxDaysPerWeek.toString(),
                decoration: InputDecoration(labelText: 'Jours max par semaine'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre valide.';
                  }
                  return null;
                },
                onSaved: (value) => _maxDaysPerWeek = int.parse(value!),
              ),
              // Champ Heures max par jour
              TextFormField(
                initialValue: _maxHoursPerDay.toString(),
                decoration: InputDecoration(labelText: 'Heures max par jour'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre valide.';
                  }
                  return null;
                },
                onSaved: (value) => _maxHoursPerDay = int.parse(value!),
              ),
              // Champ Gaps max par jour
              TextFormField(
                initialValue: _maxGapsPerDay.toString(),
                decoration: InputDecoration(labelText: 'Pauses max par jour'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre valide.';
                  }
                  return null;
                },
                onSaved: (value) => _maxGapsPerDay = int.parse(value!),
              ),
              SizedBox(height: 20),
              // Bouton de soumission
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newTeacher = Teacher(
                      id: widget.teacher?.id ?? 0,
                      username: _username,
                      email: _email,
                      password: _password,
                      role: _role,
                      subjectSpecialization: _subjectSpecialization,
                      availability: _availability,
                      assignedActivities: _assignedActivities,
                      maxDaysPerWeek: _maxDaysPerWeek,
                      maxHoursPerDay: _maxHoursPerDay,
                      maxGapsPerDay: _maxGapsPerDay,
                    );
                    if (widget.teacher == null) {
                      await _teacherService.addTeacher(newTeacher);
                    } else {
                      await _teacherService.updateTeacher(widget.teacher!.id, newTeacher);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.teacher == null ? 'Ajouter' : 'Modifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
