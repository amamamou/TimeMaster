class Matiere {

  final String nom;

  Matiere({ required this.nom});

  factory Matiere.fromJson(Map<String, dynamic> json) {
    return Matiere(
    
      nom: json['nom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'nom': nom,
    };
  }
}
