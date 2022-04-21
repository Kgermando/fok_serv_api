class LivraisonHistoryModel {
  final int? id;
  final String idProduct;
  final String quantity;
  final String quantityAchat;
  final String priceAchatUnit;
  final String prixVenteUnit;
  final String unite;
  final String margeBen;
  final String tva;
  final String remise;
  final String qtyRemise;
  final String margeBenRemise;
  final String qtyLivre;
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

  LivraisonHistoryModel(
      {this.id,
      required this.idProduct,
      required this.quantity,
      required this.quantityAchat,
      required this.priceAchatUnit,
      required this.prixVenteUnit,
      required this.unite,
      required this.margeBen,
      required this.tva,
      required this.remise,
      required this.qtyRemise,
      required this.margeBenRemise,
      required this.qtyLivre,
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
      required this.created,
  });

  factory LivraisonHistoryModel.fromSQL(List<dynamic> row) {
    return LivraisonHistoryModel(
        id: row[0],
        idProduct: row[1],
        quantity: row[2],
        quantityAchat: row[3],
        priceAchatUnit: row[4],
        prixVenteUnit: row[5],
        unite: row[6],
        margeBen: row[7],
        tva: row[8],
        remise: row[9],
        qtyRemise: row[10],
        margeBenRemise: row[11],
        qtyLivre: row[12],
        approbationDG: row[13],
        signatureDG: row[14],
        signatureJustificationDG: row[15],
        approbationFin: row[16],
        signatureFin: row[17],
        signatureJustificationFin: row[18],
        approbationBudget: row[19],
        signatureBudget: row[20],
        signatureJustificationBudget: row[21],
        approbationDD: row[22],
        signatureDD: row[23],
        signatureJustificationDD: row[24],
        succursale: row[25],
        signature: row[26],
        created: row[27]
      );
  }

  factory LivraisonHistoryModel.fromJson(Map<String, dynamic> json) {
    return LivraisonHistoryModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      quantityAchat: json['quantityAchat'],
      priceAchatUnit: json['priceAchatUnit'],
      prixVenteUnit: json['prixVenteUnit'],
      unite: json['unite'],
      margeBen: json['margeBen'],
      tva: json["tva"],
      remise: json["remise"],
      qtyRemise: json["qtyRemise"],
      margeBenRemise: json["qtyRemise"],
      qtyLivre: json["qtyLivre"],
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
      'quantity': quantity,
      'quantityAchat': quantityAchat,
      'priceAchatUnit': priceAchatUnit,
      'prixVenteUnit': prixVenteUnit,
      'unite': unite,
      'margeBen': margeBen,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "margeBenRemise": qtyRemise,
      "qtyLivre": qtyLivre,
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