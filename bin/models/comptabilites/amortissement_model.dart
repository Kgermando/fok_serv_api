class AmortissementModel {
  late int? id;
  late String titleArmotissement;
  late String comptes;
  late String intitule;
  late String montant;
  late String typeJournal; // Debit ou Credit
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
  

  AmortissementModel(
      {this.id,
      required this.titleArmotissement,
      required this.comptes,
      required this.intitule,
      required this.montant,
      required this.typeJournal,
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
 
  factory AmortissementModel.fromSQL(List<dynamic> row) {
    return AmortissementModel(
        id: row[0],
        titleArmotissement: row[1],
        comptes: row[2],
        intitule: row[3],
        montant: row[4],
        typeJournal: row[5],
        approbationDG: row[6],
        signatureDG: row[7],
        signatureJustificationDG: row[8],
        approbationFin: row[9],
        signatureFin: row[10],
        signatureJustificationFin: row[11],
        approbationBudget: row[12],
        signatureBudget: row[13],
        signatureJustificationBudget: row[14],
        approbationDD: row[15],
        signatureDD: row[16],
        signatureJustificationDD: row[17],
        signature: row[18],
        created: row[19]

    );
  }

  factory AmortissementModel.fromJson(Map<String, dynamic> json) {
    return AmortissementModel(
      id: json['id'],
      titleArmotissement: json['titleArmotissement'],
      comptes: json['comptes'],
      intitule: json['intitule'],
      montant: json['montant'],
      typeJournal: json['typeJournal'],
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
      'titleArmotissement': titleArmotissement,
      'comptes': comptes,
      'intitule': intitule,
      'montant': montant,
      'typeJournal': typeJournal,
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
