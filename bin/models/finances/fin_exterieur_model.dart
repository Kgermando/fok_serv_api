class FinanceExterieurModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late List<dynamic> coupureBillet;
  late String ligneBudgtaire; // somme d'affectation pour le budget
  late String typeOperation;
  late String numeroOperation;
  late String ressourceFin; // financement Propre ou financement exterieur

  late String signature; // celui qui fait le document
  late DateTime created;
 
  FinanceExterieurModel( 
    {
      this.id,
    required this.nomComplet,
    required this.pieceJustificative,
    required this.libelle,
    required this.montant,
    required this.coupureBillet,
    required this.ligneBudgtaire,
    required this.typeOperation,
    required this.numeroOperation,
    required this.ressourceFin,
    required this.signature,
    required this.created
  });

  factory FinanceExterieurModel.fromSQL(List<dynamic> row) {
    return FinanceExterieurModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        coupureBillet: row[5],
        ligneBudgtaire: row[6],
        typeOperation: row[7],
        numeroOperation: row[8],
        ressourceFin: row[9],
        signature: row[10],
        created: row[11]
    );
  }

  factory FinanceExterieurModel.fromJson(Map<String, dynamic> json) {
    return FinanceExterieurModel(
      id: json['id'],
      nomComplet: json['nomComplet'],
      pieceJustificative: json['pieceJustificative'],
      libelle: json['libelle'],
      montant: json['montant'],
      coupureBillet: json['coupureBillet'],
      ligneBudgtaire: json['ligneBudgtaire'],
      typeOperation: json['typeOperation'],
      numeroOperation: json['numeroOperation'],
      ressourceFin: json['ressourceFin'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
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
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'ressourceFin': ressourceFin,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
