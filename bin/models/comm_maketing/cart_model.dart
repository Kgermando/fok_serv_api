class CartModel {
  late int? id;
  late String idProductCart;
  late String quantityCart;
  late String priceCart;
  late String priceAchatUnit;
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

  CartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceCart,
    required this.priceAchatUnit,
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

  factory CartModel.fromSQL(List<dynamic> row) {
    return CartModel(
      id: row[0],
      idProductCart: row[1],
      quantityCart: row[2],
      priceCart: row[3],
      priceAchatUnit: row[4],
      unite: row[5],
      tva: row[6],
      remise: row[7],
      qtyRemise: row[8],
      approbationDG: row[9],
      signatureDG: row[10],
      signatureJustificationDG: row[11],
      approbationFin: row[12],
      signatureFin: row[13],
      signatureJustificationFin: row[14],
      approbationBudget: row[15],
      signatureBudget: row[16],
      signatureJustificationBudget: row[17],
      approbationDD: row[18],
      signatureDD: row[19],
      signatureJustificationDD: row[20],
      succursale: row[21],
      signature: row[22],
      created: row[23]
    );
  } 
 
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      idProductCart: json['idProductCart'],
      quantityCart: json['quantityCart'],
      priceCart: json['priceCart'],
      priceAchatUnit: json['priceAchatUnit'],
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
      'priceCart': priceCart,
      'priceAchatUnit': priceAchatUnit,
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
