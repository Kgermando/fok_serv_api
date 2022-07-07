class CaisseModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String departement;
  late String typeOperation;
  late String numeroOperation;
  late String signature; // celui qui fait le document
  late int createdRef;
  late DateTime created;

  CaisseModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.departement,
      required this.typeOperation,
      required this.numeroOperation,
      required this.signature,
      required this.createdRef,
      required this.created});

  factory CaisseModel.fromSQL(List<dynamic> row) {
    return CaisseModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        departement: row[5],
        typeOperation: row[6],
        numeroOperation: row[7],
        signature: row[8],
        createdRef: row[9],
        created: row[10]);
  }

  factory CaisseModel.fromJson(Map<String, dynamic> json) {
    return CaisseModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        departement: json['departement'],
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
      'departement': departement,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'createdRef': createdRef,
      'created': created.toIso8601String()
    };
  }
}
