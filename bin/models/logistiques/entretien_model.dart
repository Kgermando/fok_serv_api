class EntretienModel {
  late int? id;
  late String nom;
  late String modele;
  late String marque;
  late String etatObjet;
  late List objetRemplace;
  late String dureeTravaux;
  late DateTime created;
  late String signature;

  EntretienModel(
      {this.id,
      required this.nom,
      required this.modele,
      required this.marque,
      required this.etatObjet,
      required this.objetRemplace,
      required this.dureeTravaux,
      required this.created,
      required this.signature});

  factory EntretienModel.fromSQL(List<dynamic> row) {
    return EntretienModel(
        id: row[0],
        nom: row[1],
        modele: row[2],
        marque: row[3],
        etatObjet: row[4],
        objetRemplace: row[5],
        dureeTravaux: row[6],
        created: row[7],
        signature: row[8]);
  }

  factory EntretienModel.fromJson(Map<String, dynamic> json) {
    return EntretienModel(
        id: json['id'],
        nom: json['nom'],
        modele: json['modele'],
        marque: json['marque'],
        etatObjet: json['etatObjet'],
        objetRemplace: json['objetRemplace'],
        dureeTravaux: json['dureeTravaux'],
        created: DateTime.parse(json['created']),
        signature: json['signature']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'modele': modele,
      'marque': marque,
      'etatObjet': etatObjet,
      'objetRemplace': objetRemplace,
      'dureeTravaux': dureeTravaux,
      'created': created.toIso8601String(),
      'signature': signature
    };
  }
}
