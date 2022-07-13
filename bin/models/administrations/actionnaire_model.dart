class ActionnaireModel {
  late int? id;
  late String nom;
  late String postNom;
  late String prenom;
  late String email;
  late String telephone;
  late String adresse;
  late String sexe;
  late String matricule; 
  late String signature; // celui qui fait le document
  late int createdRef; // id de l'agent
  late DateTime created;

  ActionnaireModel(
      {this.id,
      required this.nom,
      required this.postNom,
      required this.prenom,
      required this.email,
      required this.telephone,
      required this.adresse,
      required this.sexe,
      required this.matricule, 
      required this.signature,
      required this.createdRef,
      required this.created});

  factory ActionnaireModel.fromSQL(List<dynamic> row) {
    return ActionnaireModel(
      id: row[0],
      nom: row[1],
      postNom: row[2],
      prenom: row[3],
      email: row[4],
      telephone: row[5],
      adresse: row[6],
      sexe: row[7],
      matricule: row[8],
      signature: row[9],
      createdRef: row[10],
      created: row[11]
    );
  }

  factory ActionnaireModel.fromJson(Map<String, dynamic> json) {
    return ActionnaireModel(
      id: json['id'],
      nom: json["nom"],
      postNom: json["postNom"],
      prenom: json["prenom"],
      email: json["email"],
      telephone: json["telephone"],
      adresse: json["adresse"],
      sexe: json["sexe"],
      matricule: json["matricule"],
      signature: json["signature"],
      createdRef: json["createdRef"],
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
      'matricule': matricule,
      'signature': signature,
      'createdRef': createdRef,
      'created': created.toIso8601String(),
    };
  }
}
