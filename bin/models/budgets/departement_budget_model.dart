class DepartementBudgetModel {
  late int? id;
  late String title;
  late String departement;
  late DateTime periodeDebut; // Durée
  late DateTime periodeFin; // Durée de fin

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

  DepartementBudgetModel(
      {this.id,
      required this.title,
      required this.departement,
      required this.periodeDebut,
      required this.periodeFin,
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

  factory DepartementBudgetModel.fromSQL(List<dynamic> row) {
    return DepartementBudgetModel(
        id: row[0],
        title: row[1],
        departement: row[2],
        periodeDebut: row[3],
        periodeFin: row[4],
        approbationDG: row[5],
        signatureDG: row[6],
        signatureJustificationDG: row[7],
        approbationFin: row[8],
        signatureFin: row[9],
        signatureJustificationFin: row[10],
        approbationBudget: row[11],
        signatureBudget: row[12],
        signatureJustificationBudget: row[13],
        approbationDD: row[14],
        signatureDD: row[15],
        signatureJustificationDD: row[16],
        signature: row[17],
        created: row[18]
    );
  }

  factory DepartementBudgetModel.fromJson(Map<String, dynamic> json) {
    return DepartementBudgetModel(
        id: json['id'],
        title: json['title'],
        departement: json['departement'],
        periodeDebut: DateTime.parse(json['periodeDebut']),
        periodeFin: DateTime.parse(json['periodeFin']),
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
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'departement': departement,
      'periodeDebut': periodeDebut.toIso8601String(),
      'periodeFin': periodeFin.toIso8601String(),
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
