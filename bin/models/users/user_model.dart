class UserModel {
  late int? id;
  late String? photo;
  late String nom;
  late String prenom;
  late String email;
  late String telephone;
  late String matricule;
  late String departement;
  late String servicesAffectation;
  late String fonctionOccupe;
  late String role; // Acces user de 1 à 5
  late String isOnline; // Agent connecté
  late DateTime createdAt;
  late String passwordHash;
  late String succursale;

  UserModel({
    this.id,
    this.photo,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.matricule,
    required this.departement,
    required this.servicesAffectation,
    required this.fonctionOccupe,
    required this.role,
    required this.isOnline,
    required this.createdAt,
    required this.passwordHash,
    required this.succursale,
  });

  factory UserModel.fromSQL(List<dynamic> row) {
    return UserModel(
        id: row[0],
        photo: row[1],
        nom: row[2],
        prenom: row[3],
        email: row[4],
        telephone: row[5],
        matricule: row[6],
        departement: row[7],
        servicesAffectation: row[8],
        fonctionOccupe: row[9],
        role: row[10],
        isOnline: row[11],
        createdAt: row[12],
        passwordHash: row[13],
        succursale: row[14]
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        photo: json["photo"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        telephone: json["telephone"],
        matricule: json["matricule"],
        departement: json["departement"],
        servicesAffectation: json["servicesAffectation"],
        fonctionOccupe: json["fonctionOccupe"],
        role: json["role"],
        isOnline: json["isOnline"],
        createdAt: DateTime.parse(json["createdAt"]),
        passwordHash: json["passwordHash"],
        succursale: json["succursale"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
      'matricule': matricule,
      'departement': departement,
      'servicesAffectation': servicesAffectation,
      'fonctionOccupe': fonctionOccupe,
      'role': role,
      'isOnline': isOnline.toString(),
      'createdAt': createdAt.toIso8601String(),
      'passwordHash': passwordHash,
      'succursale': succursale,
    };
  }
}
