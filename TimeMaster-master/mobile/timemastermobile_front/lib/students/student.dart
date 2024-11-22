class Student {
  final int id; // L'identifiant de l'étudiant
  final String username; // Le nom d'utilisateur de l'étudiant
  final String password; // Le mot de passe de l'étudiant
  final String role; // Le rôle de l'étudiant
  final String email; // L'adresse e-mail de l'étudiant
  final String? overlappingGroups; // Optionnel - Les groupes superposés

  Student({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
    required this.email,
    this.overlappingGroups, // Optionnel
  });

  // Méthode pour convertir une réponse JSON en un objet Student
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      email: json['email'],
      overlappingGroups: json['overlappingGroups'], // Peut être null
    );
  }

  // Méthode pour convertir un objet Student en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'email': email,
      'overlappingGroups': overlappingGroups, // Inclus si non null
    };
  }
}
