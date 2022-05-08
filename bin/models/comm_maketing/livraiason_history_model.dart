class LivraisonHistoryModel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String quantityAchat;
  late String priceAchatUnit;
  late String prixVenteUnit;
  late String unite;
  late String margeBen;
  late String tva;
  late String remise;
  late String qtyRemise;
  late String margeBenRemise;
  late String qtyLivre;
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
        succursale: row[13],
        signature: row[14],
        created: row[15]
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
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}