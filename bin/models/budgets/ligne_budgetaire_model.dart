class LigneBudgetaireModel {
  late int? id;
  late String nomLigneBudgetaire;
  late String departement;
  late String periodeBudget;
  late String uniteChoisie;
  late String nombreUnite;
  late String coutUnitaire;
  late String coutTotal;
  late String caisse;
  late String banque;
  late String finPropre;
  late String finExterieur;  // Reste à trouver

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
  late String signature;
  late DateTime created;

  LigneBudgetaireModel(
      {this.id,
      required  this.nomLigneBudgetaire,
      required  this.departement,
      required  this.periodeBudget,
      required  this.uniteChoisie,
      required  this.nombreUnite,
      required  this.coutUnitaire,
      required  this.coutTotal,
      required  this.caisse,
      required  this.banque,
      required  this.finPropre,
      required  this.finExterieur,
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

  factory LigneBudgetaireModel.fromSQL(List<dynamic> row) {
    return LigneBudgetaireModel(
      id: row[0],
      nomLigneBudgetaire: row[1],
      departement: row[2],
      periodeBudget: row[3],
      uniteChoisie: row[4],
      nombreUnite: row[5],
      coutUnitaire: row[6],
      coutTotal: row[7],
      caisse: row[8],
      banque: row[9],
      finPropre: row[10],
      finExterieur: row[11],
      approbationDG: row[12],
      signatureDG: row[13],
      signatureJustificationDG: row[14],
      approbationFin: row[15],
      signatureFin: row[16],
      signatureJustificationFin: row[17],
      approbationBudget: row[18],
      signatureBudget: row[19],
      signatureJustificationBudget: row[20],
      approbationDD: row[21],
      signatureDD: row[22],
      signatureJustificationDD: row[23],
      signature: row[24],
      created: row[25]
    );
  }

  factory LigneBudgetaireModel.fromJson(Map<String, dynamic> json) {
    return LigneBudgetaireModel(
      id: json['id'],
      nomLigneBudgetaire: json['nomLigneBudgetaire'],
      departement: json['departement'],
      periodeBudget: json['periodeBudget'],
      uniteChoisie: json['uniteChoisie'],
      nombreUnite: json['nombreUnite'],
      coutUnitaire: json['coutUnitaire'],
      coutTotal: json['coutTotal'],
      caisse: json['caisse'],
      banque: json['banque'],
      finPropre: json['finPropre'],
      finExterieur: json['finExterieur'],
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
      'nomLigneBudgetaire': nomLigneBudgetaire,
      'departement': departement,
      'periodeBudget': periodeBudget,
      'uniteChoisie': uniteChoisie,
      'nombreUnite': nombreUnite,
      'coutUnitaire': coutUnitaire,
      'coutTotal': coutTotal,
      'caisse': caisse,
      'banque': banque,
      'finPropre': finPropre,
      'finExterieur': finExterieur,
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
