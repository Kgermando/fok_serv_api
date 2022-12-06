class EntretienModel {
  late int? id;
  late String nom;
  late String typeObjet;
  late String typeMaintenance; // type de Maintenance
  late String dureeTravaux;
  late String signature; // celui qui fait le document
  late DateTime created;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;
  late String isSubmit;

  EntretienModel(
      {this.id,
      required this.nom,
      required this.typeObjet,
      required this.typeMaintenance,
      required this.dureeTravaux,
      required this.signature,
      required this.created,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD,
      required this.isSubmit});

  factory EntretienModel.fromSQL(List<dynamic> row) {
    return EntretienModel(
        id: row[0],
        nom: row[1],
        typeObjet: row[2],
        typeMaintenance: row[3],
        dureeTravaux: row[4],
        signature: row[5],
        created: row[6],
        approbationDD: row[7],
        motifDD: row[8],
        signatureDD: row[9],
        isSubmit: row[10]);
  }

  factory EntretienModel.fromJson(Map<String, dynamic> json) {
    return EntretienModel(
        id: json['id'],
        nom: json['nom'],
        typeObjet: json['typeObjet'],
        typeMaintenance: json['typeMaintenance'],
        dureeTravaux: json['dureeTravaux'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD'],
        isSubmit: json['isSubmit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'typeObjet': typeObjet,
      'typeMaintenance': typeMaintenance,
      'dureeTravaux': dureeTravaux,
      'signature': signature,
      'created': created.toIso8601String(),
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD,
      'isSubmit': isSubmit
    };
  }
}
