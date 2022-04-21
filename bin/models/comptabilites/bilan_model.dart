class BilanModel {
  late int? id;
  late String titleBilan;
  late String comptes;
  late String intitule;
  late String montant;
  late String typeBilan; // Actif ou Passif
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


  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.comptes, 
    required this.intitule, 
    required this.montant, 
    required this.typeBilan, 
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

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      comptes: row[2],
      intitule: row[3],
      montant: row[4],
      typeBilan: row[5],
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

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      comptes: json['comptes'],
      intitule: json['intitule'],
      montant: json['montant'],
      typeBilan: json['typeBilan'],
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
      'titleBilan': titleBilan,
      'comptes': comptes,
      'intitule': intitule,
      'montant': montant,
      'typeBilan': typeBilan,
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