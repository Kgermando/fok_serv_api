class VenteCartModel {
  late int? id;
  late String idProductCart;
  late String quantityCart;
  late String priceTotalCart;
  late String unite;
  late String tva;
  late String remise;
  late String qtyRemise;
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

  VenteCartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceTotalCart,
    required this.unite,
    required this.tva,
    required this.remise,
    required this.qtyRemise,
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

  factory VenteCartModel.fromSQL(List<dynamic> row) {
    return VenteCartModel(
      id: row[0],
      idProductCart: row[1],
      quantityCart: row[2],
      priceTotalCart: row[3],
      unite: row[4],
      tva: row[9],
      remise: row[10],
      qtyRemise: row[11],
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
      succursale: row[24],
      signature: row[25],
      created: row[26]
    );
  } 
 
  factory VenteCartModel.fromJson(Map<String, dynamic> json) {
    return VenteCartModel(
      id: json['id'],
      idProductCart: json['idProductCart'],
      quantityCart: json['quantityCart'],
      priceTotalCart: json['priceTotalCart'],
      unite: json['unite'],
      tva: json["tva"],
      remise: json["remise"],
      qtyRemise: json["qtyRemise"],
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
      'idProductCart': idProductCart,
      'quantityCart': quantityCart,
      'priceTotalCart': priceTotalCart,
      'unite': unite,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
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
