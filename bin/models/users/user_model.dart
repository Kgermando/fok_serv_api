class UserModel {
  late int? id;
  late String? photo;
  late String nom;
  late String prenom;
  late String matricule;
  late String departement;
  late String servicesAffectation;
  late String fonctionOccupe;
  late String role; // Acces user de 1 à 5
  late bool isOnline; // Agent connecté
  late DateTime createdAt;
  late String passwordHash;

  UserModel({
    this.id,
    this.photo,
    required this.nom,
    required this.prenom,
    required this.matricule,
    required this.departement,
    required this.servicesAffectation,
    required this.fonctionOccupe,
    required this.role,
    required this.isOnline,
    required this.createdAt,
    required this.passwordHash,
  });

  factory UserModel.fromSQL(List<dynamic> row) {
    return UserModel(
        id: row[0],
        photo: row[1],
        nom: row[2],
        prenom: row[3],
        matricule: row[4],
        departement: row[5],
        servicesAffectation: row[6],
        fonctionOccupe: row[7],
        role: row[8],
        isOnline: row[9],
        createdAt: row[10],
        passwordHash: row[11]);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        photo: json["photo"],
        nom: json["nom"],
        prenom: json["prenom"],
        matricule: json["matricule"],
        departement: json["departement"],
        servicesAffectation: json["servicesAffectation"],
        fonctionOccupe: json["fonctionOccupe"],
        role: json["role"],
        isOnline: json["isOnline"],
        createdAt: DateTime.parse(json["createdAt"]),
        passwordHash: json["passwordHash"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'nom': nom,
      'prenom': prenom,
      'matricule': matricule,
      'departement': departement,
      'servicesAffectation': servicesAffectation,
      'fonctionOccupe': fonctionOccupe,
      'role': role,
      'isOnline': isOnline,
      'createdAt': createdAt.toIso8601String(),
      'passwordHash': passwordHash
    };
  }
}
