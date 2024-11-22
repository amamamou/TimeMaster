class Teacher {
  final int id; // L'identifiant de l'enseignant
  final String username; // Nom d'utilisateur
  final String password; // Mot de passe
  final String role; // Rôle
  final String email; // Email
  final String availability; // Disponibilités (créneaux horaires)
  final int maxDaysPerWeek; // Nombre maximum de jours de travail par semaine
  final int maxHoursPerDay; // Nombre maximum d'heures de travail par jour
  final int maxGapsPerDay; // Nombre maximum de pauses autorisées par jour
  final String subjectSpecialization; // Spécialisation en matière
  final String assignedActivities; // Activités assignées à l'enseignant

  Teacher({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
    required this.email,
    required this.availability,
    required this.maxDaysPerWeek,
    required this.maxHoursPerDay,
    required this.maxGapsPerDay,
    required this.subjectSpecialization,
    required this.assignedActivities,
  });

  // Méthode pour convertir un objet JSON en instance de Teacher
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      email: json['email'],
      availability: json['availability'],
      maxDaysPerWeek: json['maxDaysPerWeek'],
      maxHoursPerDay: json['maxHoursPerDay'],
      maxGapsPerDay: json['maxGapsPerDay'],
      subjectSpecialization: json['subjectSpecialization'],
      assignedActivities: json['assignedActivities'],
    );
  }

  // Méthode pour convertir une instance de Teacher en objet JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'email': email,
      'availability': availability,
      'maxDaysPerWeek': maxDaysPerWeek,
      'maxHoursPerDay': maxHoursPerDay,
      'maxGapsPerDay': maxGapsPerDay,
      'subjectSpecialization': subjectSpecialization,
      'assignedActivities': assignedActivities,
    };
  }
}
