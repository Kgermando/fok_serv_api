class AchatModel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String quantityAchat;
  late String priceAchatUnit;
  late String prixVenteUnit;
  late String unite;
  late String tva;
  late String remise;
  late String qtyRemise;
  late String qtyLivre; // Remplace qtyRavitailler
  late String succursale;
  late String signature;
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  AchatModel(
      {this.id,
      required this.idProduct,
      required this.quantity,
      required this.quantityAchat,
      required this.priceAchatUnit,
      required this.prixVenteUnit,
      required this.unite,
      required this.tva,
      required this.remise,
      required this.qtyRemise,
      required this.qtyLivre,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
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
        tva: row[7],
        remise: row[8],
        qtyRemise: row[9],
        qtyLivre: row[10],
        succursale: row[11],
        signature: row[12],
        created: row[13],
        business: row[14],
        sync: row[15],
        async: row[16]);
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
        tva: json["tva"],
        remise: json["remise"],
        qtyRemise: json["qtyRemise"],
        qtyLivre: json["qtyLivre"],
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        business: json['business'],
      sync: json['sync'],
      async: json['async'],
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
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "qtyLivre": qtyLivre,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }
}
