class DepensesModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String naturePayement;
  late String montant;
  late List<dynamic> coupureBillet;
  late String ligneBudgtaire; // somme d'affectation pour le budget
  late String modePayement;
  late String numeroOperation;
  late DateTime created;
  
  

  DepensesModel( 
    {
      this.id,
    required this.nomComplet,
    required this.pieceJustificative,
    required this.naturePayement,
    required this.montant,
    required this.coupureBillet,
    required this.ligneBudgtaire,
    required this.modePayement,
    required this.numeroOperation,
    required this.created
  });

  factory DepensesModel.fromSQL(List<dynamic> row) {
    return DepensesModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        naturePayement: row[3],
        montant: row[4],
        coupureBillet: row[5],
        ligneBudgtaire: row[6],
        modePayement: row[7],
        numeroOperation: row[8],
        created: row[9]
    );
  }

  factory DepensesModel.fromJson(Map<String, dynamic> json) {
    return DepensesModel(
      id: json['id'],
      nomComplet: json['nomComplet'],
      pieceJustificative: json['pieceJustificative'],
      naturePayement: json['naturePayement'],
      montant: json['montant'],
      coupureBillet: json['coupureBillet'],
      ligneBudgtaire: json['ligneBudgtaire'],
      modePayement: json['modePayement'],
      numeroOperation: json['numeroOperation'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'pieceJustificative': pieceJustificative,
      'naturePayement': naturePayement,
      'montant': montant,
      'coupureBillet': coupureBillet,
      'ligneBudgtaire': ligneBudgtaire,
      'modePayement': modePayement,
      'numeroOperation': numeroOperation,
      'created': created.toIso8601String()
    };
  }
}
