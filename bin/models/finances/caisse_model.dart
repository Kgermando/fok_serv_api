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
      approbationDG: row[11],
      signatureDG: row[12],
      signatureJustificationDG: row[13],
      approbationFin: row[14],
      signatureFin: row[15],
      signatureJustificationFin: row[16],
      approbationBudget: row[17],
      signatureBudget: row[18],
      signatureJustificationBudget: row[19],
      approbationDD: row[20],
      signatureDD: row[21],
      signatureJustificationDD: row[22],
      signature: row[23],
      created: row[24]
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
      'libelle': libelle,
      'montant': montant,
      'coupureBillet': coupureBillet,
      'ligneBudgtaire': ligneBudgtaire,
      'resources': resources,
      'departement': departement,
      'typeOperation': typeOperation,
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
