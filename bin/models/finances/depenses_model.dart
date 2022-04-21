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
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationFin;
  late String signatureFin;
  late String signatureJustificationFin;

  late String approbationBudget;
  late String signatureBudget;
  late String signatureJustificationBudget;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature; // celui qui fait le document
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
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationFin,
      required this.signatureFin,
      required this.signatureJustificationFin,
      required this.approbationBudget,
      required this.signatureBudget,
      required this.signatureJustificationBudget,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
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
        approbationDG: row[9],
        signatureDG: row[10],
        signatureJustificationDG: row[11],
        approbationFin: row[12],
        signatureFin: row[13],
        signatureJustificationFin: row[14],
        approbationBudget: row[15],
        signatureBudget: row[16],
        signatureJustificationBudget: row[17],
        approbationDD: row[18],
        signatureDD: row[19],
        signatureJustificationDD: row[20],
        signature: row[21],
        created: row[22]
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
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationFin: json['approbationFin'],
        signatureFin: json['signatureFin'],
        signatureJustificationFin: json['signatureJustificationFin'],
        approbationBudget: json['approbationBudget'],
        signatureBudget: json['signatureBudget'],
        signatureJustificationBudget: json['signatureJustificationBudget'],
        approbationDD: json['approbationDD'],
        signatureDD: json['signatureDD'],
        signatureJustificationDD: json['signatureJustificationDD'],
        signature: json['signature'],
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
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationFin': approbationFin,
      'signatureFin': signatureFin,
      'signatureJustificationFin': signatureJustificationFin,
      'approbationBudget': approbationBudget,
      'signatureBudget': signatureBudget,
      'signatureJustificationBudget': signatureJustificationBudget,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
