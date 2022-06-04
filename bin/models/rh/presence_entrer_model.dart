class PresenceEntrerModel {
  late int? id;
  late DateTime reference;
  late String nom;
  late String prenom;
  late String matricule;
  late String note;
  late String signature; // celui qui fait le document
  late DateTime created;

  PresenceEntrerModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.prenom,
      required this.matricule,
      required this.note,
      required this.signature,
      required this.created});

  factory PresenceEntrerModel.fromSQL(List<dynamic> row) {
    return PresenceEntrerModel(
      id: row[0],
      reference: row[1],
      nom: row[2],
      prenom: row[3],
      matricule: row[4],
      note: row[5],
      signature: row[6],
      created: row[7]
    );
  }

  factory PresenceEntrerModel.fromJson(Map<String, dynamic> json) {
    return PresenceEntrerModel(
        id: json['id'],
        reference: DateTime.parse(json['reference']),
        nom: json['nom'],
        prenom: json['prenom'],
        matricule: json['matricule'],
        note: json['note'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
      'nom': nom,
      'prenom': prenom,
      'matricule': matricule,
      'note': note,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
