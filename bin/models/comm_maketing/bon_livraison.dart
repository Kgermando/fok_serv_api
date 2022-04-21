class BonLivraisonModel {
  late int? id;
  late String idProduct;
  late String quantityAchat;
  late String priceAchatUnit; 
  late String prixVenteUnit;
  late String unite;
  late String firstName;
  late String lastName;
  late String tva;
  late String remise;
  late String qtyRemise;
  late bool accuseReception;
  late String accuseReceptionFirstName;
  late String accuseReceptionLastName;
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

  BonLivraisonModel({
    this.id,
    required this.idProduct,
    required this.quantityAchat,
    required this.priceAchatUnit,
    required this.prixVenteUnit,
    required this.unite,
    required this.firstName,
    required this.lastName,
    required this.tva,
    required this.remise,
    required this.qtyRemise,
    required this.accuseReception,
    required this.accuseReceptionFirstName,
    required this.accuseReceptionLastName,
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

  factory BonLivraisonModel.fromSQL(List<dynamic> row) {
    return BonLivraisonModel(
      id: row[0],
      idProduct: row[1],
      quantityAchat: row[2],
      priceAchatUnit: row[3],
      prixVenteUnit: row[4],
      unite: row[5],
      firstName: row[6],
      lastName: row[7],
      tva: row[8],
      remise: row[9],
      qtyRemise: row[10],
      accuseReception: row[11],
      accuseReceptionFirstName: row[12],
      accuseReceptionLastName: row[13],
      approbationDG: row[14],
      signatureDG: row[15],
      signatureJustificationDG: row[16],
      approbationFin: row[17],
      signatureFin: row[18],
      signatureJustificationFin: row[19],
      approbationBudget: row[20],
      signatureBudget: row[21],
      signatureJustificationBudget: row[22],
      approbationDD: row[23],
      signatureDD: row[24],
      signatureJustificationDD: row[25],
      succursale: row[26],
      signature: row[27],
      created: row[28]
    );
  }

  factory BonLivraisonModel.fromJson(Map<String, dynamic> json) {
    return BonLivraisonModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantityAchat: json['quantityAchat'],
      priceAchatUnit: json['priceAchatUnit'],
      prixVenteUnit: json['prixVenteUnit'],
      unite: json['unite'],
      firstName: json["firstName"],
      lastName: json["lastName"],
      tva: json["tva"],
      remise: json["remise"],
      qtyRemise: json["qtyRemise"],
      accuseReception: json["accuseReception"],
      accuseReceptionFirstName: json["accuseReceptionFirstName"],
      accuseReceptionLastName: json["accuseReceptionLastName"],
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
      'idProduct': idProduct,
      'quantityAchat': quantityAchat,
      'priceAchatUnit': priceAchatUnit,
      'prixVenteUnit': prixVenteUnit,
      'unite': unite,
      "firstName": firstName,
      "lastName": lastName,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "accuseReception": accuseReception,
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName,
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