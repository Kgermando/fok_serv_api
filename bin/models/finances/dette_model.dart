class DetteModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String numeroOperation;
  late DateTime created;
  late String signature;

  DetteModel( 
    {
      this.id,
    required this.nomComplet,
    required this.pieceJustificative,
    required this.libelle,
    required this.montant,
    required this.numeroOperation,
    required this.created,
    required this.signature,
  });

  factory DetteModel.fromSQL(List<dynamic> row) {
    return DetteModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        numeroOperation: row[5],
        created: row[6],
        signature: row[7]
    ); 
  }

  factory DetteModel.fromJson(Map<String, dynamic> json) {
    return DetteModel(
      id: json['id'],
      nomComplet: json['nomComplet'],
      pieceJustificative: json['pieceJustificative'],
      libelle: json['libelle'],
      montant: json['montant'],
      numeroOperation: json['numeroOperation'],
      created: DateTime.parse(json['created']),
      signature: json['signature']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montant': montant,
      'numeroOperation': numeroOperation,
      'created': created.toIso8601String(),
      'signature': signature,
    };
  }
}
