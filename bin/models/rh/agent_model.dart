class AgentModel {
  late int? id;
  late String nom;
  late String postNom;
  late String prenom;
  late String email;
  late String telephone;
  late String adresse;
  late String sexe;
  late String role; // droit d'acces au logiciel de 0 à 5
  late String matricule;
  late String numeroSecuriteSociale;
  late DateTime dateNaissance;
  late String lieuNaissance;
  late String nationalite;
  late String typeContrat;
  late String departement;
  late String servicesAffectation;
  late DateTime dateDebutContrat;
  late DateTime dateFinContrat;
  late String fonctionOccupe; // Fonction occupé
  late String? competance;
  late String? experience;
  late String statutAgent;
  late DateTime createdAt;
  late String? photo;
  late String salaire;
  late String signature; // celui qui fait le document
  late DateTime created;

  AgentModel({
    this.id,
    required this.nom,
    required this.postNom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.sexe,
    required this.role,
    required this.matricule,
    required this.numeroSecuriteSociale,
    required this.dateNaissance,
    required this.lieuNaissance,
    required this.nationalite,
    required this.typeContrat,
    required this.departement,
    required this.servicesAffectation,
    required this.dateDebutContrat,
    required this.dateFinContrat,
    required this.fonctionOccupe,
    this.competance,
    this.experience,
    required this.statutAgent,
    required this.createdAt,
    this.photo,
    required this.salaire,
    required this.signature,
    required this.created,
  });

  factory AgentModel.fromSQL(List<dynamic> row) {
    return AgentModel(
        id: row[0],
        nom: row[1],
        postNom: row[2],
        prenom: row[3],
        email: row[4],
        telephone: row[5],
        adresse: row[6],
        sexe: row[7],
        role: row[8],
        matricule: row[9],
        numeroSecuriteSociale: row[10],
        dateNaissance: row[11],
        lieuNaissance: row[12],
        nationalite: row[13],
        typeContrat: row[14],
        departement: row[15],
        servicesAffectation: row[16],
        dateDebutContrat: row[17],
        dateFinContrat: row[18],
        fonctionOccupe: row[19],
        competance: row[20],
        experience: row[21],
        statutAgent: row[22],
        createdAt: row[23],
        photo: row[24],
        salaire: row[25],
        signature: row[26],
        created: row[27]);
  }

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json["id"],
      nom: json["nom"],
      postNom: json["postNom"],
      prenom: json["prenom"],
      email: json["email"],
      telephone: json["telephone"],
      adresse: json["adresse"],
      sexe: json["sexe"],
      role: json["role"],
      matricule: json["matricule"],
      numeroSecuriteSociale: json["numeroSecuriteSociale"],
      dateNaissance: DateTime.parse(json['dateNaissance']),
      lieuNaissance: json["lieuNaissance"],
      nationalite: json["nationalite"],
      typeContrat: json["typeContrat"],
      departement: json["departement"],
      servicesAffectation: json["servicesAffectation"],
      dateDebutContrat: DateTime.parse(json['dateDebutContrat']),
      dateFinContrat: DateTime.parse(json['dateFinContrat']),
      fonctionOccupe: json["fonctionOccupe"],
      competance: json["competance"],
      experience: json["experience"],
      statutAgent: json['statutAgent'],
      createdAt: DateTime.parse(json["createdAt"]),
      photo: json["photo"],
      salaire: json["salaire"],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'postNom': postNom,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
      'adresse': adresse,
      'sexe': sexe,
      'role': role,
      'matricule': matricule,
      'numeroSecuriteSociale': numeroSecuriteSociale,
      'dateNaissance': dateNaissance.toIso8601String(),
      'lieuNaissance': lieuNaissance,
      'nationalite': nationalite,
      'typeContrat': typeContrat,
      'departement': departement,
      'servicesAffectation': servicesAffectation,
      'dateDebutContrat': dateDebutContrat.toIso8601String(),
      'dateFinContrat': dateFinContrat.toIso8601String(),
      'fonctionOccupe': fonctionOccupe,
      'competance': competance,
      'experience': experience,
      'statutAgent': statutAgent.toString(),
      'createdAt': createdAt.toIso8601String(),
      'photo': photo,
      'salaire': salaire,
      'signature': signature,
      'created': created.toIso8601String(),
    };
  }
}
