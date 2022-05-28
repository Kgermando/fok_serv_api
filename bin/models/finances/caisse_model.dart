class CaisseModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late List<dynamic> coupureBillet;
  late String ligneBudgtaire; // somme d'affectation pour le budget
  late String resources; // resource mis a disposition pour ce projet
  late String departement;
  late String typeOperation;
  late String numeroOperation;

  late String signature; // celui qui fait le document
  late DateTime created;

  CaisseModel( 
    {
      this.id,
    required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.coupureBillet,
      required this.ligneBudgtaire,
      required this.resources,
      required this.departement,
      required this.typeOperation,
      required this.numeroOperation,
      required this.signature,
      required this.created
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
      resources: row[7],
      departement: row[8],
      typeOperation: row[9],
      numeroOperation: row[10],
      signature: row[11],
      created: row[12]
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
      resources: json['resources'],
      departement: json['departement'],
      typeOperation: json['typeOperation'],
      numeroOperation: json['numeroOperation'],
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
      'resources': resources,
      'departement': departement,
      'typeOperation': typeOperation,
      'numeroOperation': numeroOperation,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}


class CaisseChartModel {
  late String typeOperation;
  late double sum;

  CaisseChartModel({
    required this.typeOperation,
    required this.sum
    }
  );

  factory CaisseChartModel.fromSQL(List<dynamic> row) {
    return CaisseChartModel(
        typeOperation: row[0],
        sum: row[1]
    );
  }

  factory CaisseChartModel.fromJson(Map<String, dynamic> json) {
    return CaisseChartModel(
        typeOperation: json['typeOperation'],
        sum: json['sum']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'typeOperation': typeOperation,
      'sum': sum,
    };
  }
}