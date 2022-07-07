class FinanceExterieurModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String typeOperation;
  late String numeroOperation;
  late String signature; // celui qui fait le document
  late int createdRef;
  late DateTime created;

  FinanceExterieurModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.typeOperation,
      required this.numeroOperation,
      required this.signature,
      required this.createdRef,
      required this.created});

  factory FinanceExterieurModel.fromSQL(List<dynamic> row) {
    return FinanceExterieurModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        typeOperation: row[5],
        numeroOperation: row[6],
        signature: row[7],
        createdRef: row[8],
        created: row[9]);
  }

  factory FinanceExterieurModel.fromJson(Map<String, dynamic> json) {
    return FinanceExterieurModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        typeOperation: json['typeOperation'],
        numeroOperation: json['numeroOperation'],
        signature: json['signature'],
        createdRef: json['createdRef'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'libelle': libelle,
      'montant': montant,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'createdRef': createdRef,
      'created': created.toIso8601String()
    };
  }
}
