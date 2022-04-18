class AchatModel {
  final int? id;
  final String idProduct;
  final String quantity;
  final String quantityAchat;
  final String priceAchatUnit;
  final String prixVenteUnit;
  final String unite;
  final DateTime created;
  final String telephone;
  final String succursale;
  final String nameBusiness;
  final String tva;
  final String remise;
  final String qtyRemise;
  final String qtyLivre;

  const AchatModel({
    this.id,
    required this.idProduct,
    required this.quantity,
    required this.quantityAchat,
    required this.priceAchatUnit,
    required this.prixVenteUnit,
    required this.unite,
    required this.created,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.tva,
    required this.remise,
    required this.qtyRemise,
    required this.qtyLivre
  });

  factory AchatModel.fromSQL(List<dynamic> row) {
    return AchatModel(
      id: row[0],
      idProduct: row[1],
      quantity: row[2],
      quantityAchat: row[3],
      priceAchatUnit: row[4],
      prixVenteUnit: row[5],
      unite: row[6],
      created: row[7],
      telephone: row[8],
      succursale: row[9],
      nameBusiness: row[10],
      tva: row[11],
      remise: row[12],
      qtyRemise: row[13],
      qtyLivre: row[14]
    );
  }

  factory AchatModel.fromJson(Map<String, dynamic> json) {
    return AchatModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      quantityAchat: json['quantityAchat'],
      priceAchatUnit: json['priceAchatUnit'],
      prixVenteUnit: json['prixVenteUnit'],
      unite: json['unite'],
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
      tva: json["tva"],
      remise: json["remise"],
      qtyRemise: json["qtyRemise"],
      qtyLivre: json["qtyLivre"]
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
      'created': created.toIso8601String(),
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "qtyLivre": qtyLivre
    };
  }
}
