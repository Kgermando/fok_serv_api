class AnnuaireModel {
  late int? id;
  late String categorie;
  late String nomPostnomPrenom;
  late String email;
  late String mobile1;
  late String mobile2;
  late String secteurActivite;
  late String nomEntreprise;
  late String grade;
  late String adresseEntreprise;

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

  AnnuaireModel({
    this.id, 
    required this.categorie,
    required this.nomPostnomPrenom,
    required this.email, 
    required this.mobile1,
    required this.mobile2,
    required this.secteurActivite, 
    required this.nomEntreprise, 
    required this.grade, 
    required this.adresseEntreprise,
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

  factory AnnuaireModel.fromSQL(List<dynamic> row) {
    return AnnuaireModel(
        id: row[0],
        categorie: row[1],
        nomPostnomPrenom: row[2],
        email: row[3],
        mobile1: row[4],
        mobile2: row[5],
        secteurActivite: row[6],
        nomEntreprise: row[7],
        grade: row[8],
        adresseEntreprise: row[9],
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

  factory AnnuaireModel.fromJson(Map<String, dynamic> json) {
    return AnnuaireModel(
      id: json['id'],
      categorie: json['categorie'],
      nomPostnomPrenom: json['nomPostnomPrenom'],
      email: json['email'],
      mobile1: json['mobile1'],
      mobile2: json['mobile2'],
      secteurActivite: json['secteurActivite'],
      nomEntreprise: json['nomEntreprise'],
      grade: json['grade'],
      adresseEntreprise: json['adresseEntreprise'],
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
      'categorie': categorie,
      'nomPostnomPrenom': nomPostnomPrenom,
      'email': email,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'secteurActivite': secteurActivite,
      'nomEntreprise': nomEntreprise,
      'grade': grade,
      'adresseEntreprise': adresseEntreprise,
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
