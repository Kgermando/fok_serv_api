class NumberFactureModel {
  late int? id;
  late String number;
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
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;

  NumberFactureModel(
    {this.id,
    required this.number,
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
    required this.succursale,
    required this.signature,
    required this.created
  });

  factory NumberFactureModel.fromSQL(List<dynamic> row) {
    return NumberFactureModel(
        id: row[0],
        number: row[1],
        approbationDG: row[2],
        signatureDG: row[3],
        signatureJustificationDG: row[4],
        approbationFin: row[5],
        signatureFin: row[6],
        signatureJustificationFin: row[7],
        approbationBudget: row[8],
        signatureBudget: row[9],
        signatureJustificationBudget: row[10],
        approbationDD: row[11],
        signatureDD: row[12],
        signatureJustificationDD: row[13],
        succursale: row[14],
        signature: row[15],
        created: row[16]
    );
  }

  factory NumberFactureModel.fromJson(Map<String, dynamic> json) {
    return NumberFactureModel(
        id: json['id'],
        number: json['number'],
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
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
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
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
