class UserProfile {
  final int id;
  final String username;
  final String email;
  final String role;

  UserProfile({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
    );
  }
}
