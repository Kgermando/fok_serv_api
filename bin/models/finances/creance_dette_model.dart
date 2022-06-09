class CreanceDetteModel {
  late int? id;
  late DateTime reference;
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
      required this.reference,
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
        reference: row[1],
        nomComplet: row[2],
        pieceJustificative: row[3],
        libelle: row[4],
        montant: row[5],
        creanceDette: row[6],
        signature: row[7],
        created: row[8]);
  }

  factory CreanceDetteModel.fromJson(Map<String, dynamic> json) {
    return CreanceDetteModel(
        id: json['id'],
        reference: DateTime.parse(json['reference']),
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        creanceDette: json['creanceDette'],
        signature: json['signature'],
        created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
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