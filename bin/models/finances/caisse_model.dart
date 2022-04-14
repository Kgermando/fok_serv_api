class CaisseModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late List<dynamic> coupureBillet;
  late String ligneBudgtaire; // somme d'affectation pour le budget
  late String departement;
  late String typeOperation;
  late String numeroOperation;
  late DateTime created;
  late String signature;

  CaisseModel( 
    {
      this.id,
    required this.nomComplet,
    required this.pieceJustificative,
    required this.libelle,
    required this.montant,
    required this.coupureBillet,
    required this.ligneBudgtaire,
    required this.departement,
    required this.typeOperation,
    required this.numeroOperation,
    required this.created,
    required this.signature
  });

  factory CaisseModel.fromSQL(List<dynamic> row) {
    return CaisseModel(
      id: row[0],
      nomComplet: row[1],
      pieceJustificative: row[2],
      libelle: row[3],
      montant: row[4],
      coupureBillet: row[5],
      ligneBudgtaire: row[6],
      departement: row[7],
      typeOperation: row[8],
      numeroOperation: row[9],
      created: row[10],
      signature: row[11]
    );
  }

  factory CaisseModel.fromJson(Map<String, dynamic> json) {
    return CaisseModel(
      id: json['id'],
      nomComplet: json['nomComplet'],
      pieceJustificative: json['pieceJustificative'],
      libelle: json['libelle'],
      montant: json['montant'],
      coupureBillet: json['coupureBillet'],
      ligneBudgtaire: json['ligneBudgtaire'],
      departement: json['departement'],
      typeOperation: json['typeOperation'],
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
      'coupureBillet': coupureBillet,
      'ligneBudgtaire': ligneBudgtaire,
      'departement': departement,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'created': created.toIso8601String(),
      'signature': signature
    };
  }
}
