class ValorisationModel {
  late int? id;
  late String numeroOrdre;
  late String intitule;
  late String quantite;
  late String prixUnitaire;
  late String prixTotal;
  late String source;
  
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

  ValorisationModel({
    this.id,
    required this.numeroOrdre,
    required this.intitule,
    required this.quantite,
    required this.prixUnitaire,
    required this.prixTotal,
    required this.source,
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

  factory ValorisationModel.fromSQL(List<dynamic> row) {
    return ValorisationModel(
      id: row[0],
      numeroOrdre: row[1],
      intitule: row[2],
      quantite: row[3],
      prixUnitaire: row[4],
      prixTotal: row[5],
      source: row[6],
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

  factory ValorisationModel.fromJson(Map<String, dynamic> json) {
    return ValorisationModel(
      id: json['id'],
      numeroOrdre: json['numeroOrdre'],
      intitule: json['intitule'],
      quantite: json['quantite'],
      prixUnitaire: json['prixUnitaire'],
      prixTotal: json['prixTotal'],
      source: json['source'],
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
      'numeroOrdre': numeroOrdre,
      'intitule': intitule,
      'quantite': quantite,
      'prixUnitaire': prixUnitaire,
      'prixTotal': prixTotal,
      'source': source,
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
