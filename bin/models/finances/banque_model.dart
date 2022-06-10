class BanqueModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late List<dynamic> coupureBillet;
  late String departement;
  late String typeOperation;
  late String numeroOperation;

  late String signature; // celui qui fait le document
  late DateTime created;

  BanqueModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.coupureBillet,
      required this.departement,
      required this.typeOperation,
      required this.numeroOperation,
      required this.signature,
      required this.created});

  factory BanqueModel.fromSQL(List<dynamic> row) {
    return BanqueModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        coupureBillet: row[5],
        departement: row[6],
        typeOperation: row[7],
        numeroOperation: row[8],
        signature: row[9],
        created: row[10]);
  }

  factory BanqueModel.fromJson(Map<String, dynamic> json) {
    return BanqueModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        coupureBillet: json['coupureBillet'],
        departement: json['departement'],
        typeOperation: json['typeOperation'],
        numeroOperation: json['numeroOperation'],
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
      'coupureBillet': coupureBillet,
      'departement': departement,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
