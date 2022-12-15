class FinanceExterieurModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montantDepot;
  late String typeOperation;
  late String numeroOperation;
  late String signature; // celui qui fait le document
  late int reference;
  late String financeExterieurName;
  late DateTime created; 
  late String montantRetrait;

  FinanceExterieurModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montantDepot,
      required this.typeOperation,
      required this.numeroOperation,
      required this.signature,
      required this.reference,
      required this.financeExterieurName,
      required this.created,
    required this.montantRetrait,
  });

  factory FinanceExterieurModel.fromSQL(List<dynamic> row) {
    return FinanceExterieurModel(
      id: row[0],
      nomComplet: row[1],
      pieceJustificative: row[2],
      libelle: row[3],
      montantDepot: row[4],
      typeOperation: row[5],
      numeroOperation: row[6],
      signature: row[7],
      reference: row[8],
      financeExterieurName: row[9],
      created: row[10],
      montantRetrait: row[11],
    );
  }

  factory FinanceExterieurModel.fromJson(Map<String, dynamic> json) {
    return FinanceExterieurModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montantDepot: json['montantDepot'],
        typeOperation: json['typeOperation'],
        numeroOperation: json['numeroOperation'],
        signature: json['signature'],
        reference: json['reference'],
        financeExterieurName: json['financeExterieurName'],
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
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'reference': reference,
      'financeExterieurName': financeExterieurName,
      'created': created.toIso8601String(),
      'montantRetrait': montantRetrait,
    };
  }
}
