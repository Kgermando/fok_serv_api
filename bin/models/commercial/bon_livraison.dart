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

  late String accuseReception;
  late String accuseReceptionFirstName;
  late String accuseReceptionLastName;

  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  BonLivraisonModel(
      {this.id,
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
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
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
        succursale: row[14],
        signature: row[15],
        created: row[16],
        business: row[17],
        sync: row[18],
        async: row[19]);
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
      'quantityAchat': quantityAchat,
      'priceAchatUnit': priceAchatUnit,
      'prixVenteUnit': prixVenteUnit,
      'unite': unite,
      "firstName": firstName,
      "lastName": lastName,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise,
      "accuseReception": accuseReception.toString(),
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }
}
