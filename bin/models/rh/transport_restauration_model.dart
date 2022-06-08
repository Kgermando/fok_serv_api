class TransportRestaurationModel {
  late int? id;
  late String title;
  late String observation;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;

  TransportRestaurationModel(
      {this.id,
      required this.title,
      required this.observation,
      required this.signature,
      required this.createdRef,
      required this.created});

  factory TransportRestaurationModel.fromSQL(List<dynamic> row) {
    return TransportRestaurationModel(
        id: row[0],
        title: row[1],
        observation: row[2],
        signature: row[3],
        createdRef: row[4],
        created: row[5]);
  }

  factory TransportRestaurationModel.fromJson(Map<String, dynamic> json) {
    return TransportRestaurationModel(
        id: json['id'],
        title: json['title'],
        observation: json['observation'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'observation': observation,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}

class TransRestAgentsModel {
  late int? id;
  late DateTime reference;
  late String nom;
  late String prenom;
  late String matricule;
  late String montant;

  TransRestAgentsModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.prenom,
      required this.matricule,
      required this.montant});

  factory TransRestAgentsModel.fromSQL(List<dynamic> row) {
    return TransRestAgentsModel(
        id: row[0],
        reference: row[1],
        nom: row[2],
        prenom: row[3],
        matricule: row[4],
        montant: row[5]);
  }

  factory TransRestAgentsModel.fromJson(Map<String, dynamic> json) {
    return TransRestAgentsModel(
      id: json['id'],
      reference: DateTime.parse(json['reference']),
      nom: json['nom'],
      prenom: json['prenom'],
      matricule: json['matricule'],
      montant: json['montant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
      'nom': nom,
      'prenom': prenom,
      'matricule': matricule,
      'montant': montant
    };
  }
}
