class DetteModel {
  late int? id;
  late String nomComplet;
  late String pieceJustificative;
  late String libelle;
  late String montant;
  late String numeroOperation;
  late bool statutPaie;
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

  DetteModel(
      {this.id,
      required this.nomComplet,
      required this.pieceJustificative,
      required this.libelle,
      required this.montant,
      required this.numeroOperation,
      required this.statutPaie,
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
      required this.created});

  factory DetteModel.fromSQL(List<dynamic> row) {
    return DetteModel(
        id: row[0],
        nomComplet: row[1],
        pieceJustificative: row[2],
        libelle: row[3],
        montant: row[4],
        numeroOperation: row[5],
        statutPaie: row[9],
        approbationDG: row[10],
        signatureDG: row[11],
        signatureJustificationDG: row[12],
        approbationFin: row[13],
        signatureFin: row[14],
        signatureJustificationFin: row[15],
        approbationBudget: row[16],
        signatureBudget: row[17],
        signatureJustificationBudget: row[18],
        approbationDD: row[19],
        signatureDD: row[20],
        signatureJustificationDD: row[21],
        signature: row[22],
        created: row[23]
    );
  }

  factory DetteModel.fromJson(Map<String, dynamic> json) {
    return DetteModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        pieceJustificative: json['pieceJustificative'],
        libelle: json['libelle'],
        montant: json['montant'],
        numeroOperation: json['numeroOperation'],
        statutPaie: json['statutPaie'],
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
      'numeroOperation': numeroOperation,
      'statutPaie': statutPaie,
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
