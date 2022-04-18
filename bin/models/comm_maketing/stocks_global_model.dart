class StocksGlobalMOdel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String quantityAchat;
  late String priceAchatUnit;
  late String prixVenteUnit;
  late String unite;
  late bool modeAchat;
  late DateTime created;
  late String telephone;
  late String succursale;
  late String nameBusiness;
  late String tva;
  late String qtyRavitailler;

  StocksGlobalMOdel({
    this.id,
    required this.idProduct,
    required this.quantity,
    required this.quantityAchat,
    required this.priceAchatUnit,
    required this.prixVenteUnit,
    required this.unite,
    required this.modeAchat,
    required this.created,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.tva,
    required this.qtyRavitailler,
  });

  factory StocksGlobalMOdel.fromSQL(List<dynamic> row) {
    return StocksGlobalMOdel(
      id: row[0],
      idProduct: row[1],
      quantity: row[2],
      quantityAchat: row[3],
      priceAchatUnit: row[4],
      prixVenteUnit: row[5],
      unite: row[6],
      modeAchat: row[7],
      created: row[8],
      telephone: row[9],
      succursale: row[10],
      nameBusiness: row[11],
      tva: row[12],
      qtyRavitailler: row[13]
    );
  }

  factory StocksGlobalMOdel.fromJson(Map<String, dynamic> json) {
    return StocksGlobalMOdel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      quantityAchat: json['quantityAchat'],
      priceAchatUnit: json['priceAchatUnit'],
      prixVenteUnit: json['prixVenteUnit'],
      unite: json['unite'],
      modeAchat: json['modeAchat'],
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
      tva: json["tva"],
      qtyRavitailler: json["qtyRavitailler"]
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
      'modeAchat': modeAchat,
      'created': created.toIso8601String(),
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
      "tva": tva,
      "qtyRavitailler": qtyRavitailler
    };
  }
}
