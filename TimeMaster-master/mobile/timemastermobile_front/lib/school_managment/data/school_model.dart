class School {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;

  School({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  /// Factory constructor to create a `School` instance from a JSON map
  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }

  /// Method to convert a `School` instance back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }
}
