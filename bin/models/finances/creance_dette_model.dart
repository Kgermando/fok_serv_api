class CreanceDetteModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String creanceDette;
  late String signature;
  late DateTime created;

  CreanceDetteModel(
      {
        this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.creanceDette,
      required this.signature,
      required this.created
    }
  );

  factory CreanceDetteModel.fromSQL(List<dynamic> row) {
    return CreanceDetteModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        creanceDette: row[5],
        signature: row[6],
        created: row[7]);
  }

  factory CreanceDetteModel.fromJson(Map<String, dynamic> json) {
    return CreanceDetteModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        creanceDette: json['creanceDette'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montant': montant,
      'creanceDette': creanceDette,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}