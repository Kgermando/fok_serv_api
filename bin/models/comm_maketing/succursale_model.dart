class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String province;
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

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.province,
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

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      province: row[3],
      approbationDG: row[4],
      signatureDG: row[5],
      signatureJustificationDG: row[6],
      approbationFin: row[7],
      signatureFin: row[8],
      signatureJustificationFin: row[9],
      approbationBudget: row[10],
      signatureBudget: row[11],
      signatureJustificationBudget: row[12],
      approbationDD: row[13],
      signatureDD: row[14],
      signatureJustificationDD: row[15],
      signature: row[16],
      created: row[17]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      province: json['province'],
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
      'name': name,
      'adresse': adresse,
      'province': province,
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