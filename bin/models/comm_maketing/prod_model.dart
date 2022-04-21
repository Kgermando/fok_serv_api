class ProductModel {
  late int? id;
  late String categorie;
  late String sousCategorie1;
  late String sousCategorie2;
  late String sousCategorie3;
  late String sousCategorie4;
  late String idProduct;
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

  ProductModel({
    this.id,
    required this.categorie,
    required this.sousCategorie1,
    required this.sousCategorie2,
    required this.sousCategorie3,
    required this.sousCategorie4,
    required this.idProduct,
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


  factory ProductModel.fromSQL(List<dynamic> row) {
    return ProductModel(
      id: row[0],
      categorie: row[1],
      sousCategorie1: row[2],
      sousCategorie2: row[3],
      sousCategorie3: row[4],
      sousCategorie4: row[5],
      idProduct: row[6],
      approbationDG: row[7],
      signatureDG: row[8],
      signatureJustificationDG: row[9],
      approbationFin: row[10],
      signatureFin: row[11],
      signatureJustificationFin: row[12],
      approbationBudget: row[13],
      signatureBudget: row[14],
      signatureJustificationBudget: row[15],
      approbationDD: row[16],
      signatureDD: row[17],
      signatureJustificationDD: row[18],
      succursale: row[26],
      signature: row[27],
      created: row[28]
    );
  }

 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categorie: json['categorie'],
      sousCategorie1: json['sousCategorie1'],
      sousCategorie2: json['sousCategorie2'],
      sousCategorie3: json['sousCategorie3'],
      sousCategorie4: json['sousCategorie4'],
      idProduct: json['idProduct'], 
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
      'categorie': categorie,
      'sousCategorie1': sousCategorie1,
      'sousCategorie2': sousCategorie2,
      'sousCategorie3': sousCategorie3,
      'sousCategorie4': sousCategorie4,
      'idProduct': idProduct,
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
