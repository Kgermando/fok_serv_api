class BanqueModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montantDepot;
  late String departement;
  late String typeOperation;
  late String numeroOperation;
  late String signature; // celui qui fait le document
  late int reference;
  late String banqueName;
  late DateTime created;
  late String montantRetrait;

  BanqueModel(
      {this.id,
    required this.nomComplet,
    required this.pieceJustificative,
    required this.libelle,
    required this.montantDepot,
    required this.departement,
    required this.typeOperation,
    required this.numeroOperation,
    required this.signature,
    required this.reference,
    required this.banqueName,
    required this.created,
    required this.montantRetrait,
  });

  factory BanqueModel.fromSQL(List<dynamic> row) {
    return BanqueModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montantDepot: row[4],
        departement: row[5],
        typeOperation: row[6],
        numeroOperation: row[7],
        signature: row[8],
        reference: row[9],
        banqueName: row[10],
        created: row[11],
      montantRetrait: row[12]
    );
  }

  factory BanqueModel.fromJson(Map<String, dynamic> json) {
    return BanqueModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montantDepot: json['montantDepot'],
        departement: json['departement'],
        typeOperation: json['typeOperation'],
        numeroOperation: json['numeroOperation'],
        signature: json['signature'],
        reference: json['reference'],
        banqueName: json['banqueName'],
        created: DateTime.parse(json['created']),
      montantRetrait: json['montantRetrait'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montantDepot': montantDepot,
      'departement': departement,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'reference': reference,
      'banqueName': banqueName,
      'created': created.toIso8601String(),
      'montantRetrait': montantRetrait
    };
  }
}
