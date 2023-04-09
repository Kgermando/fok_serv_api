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
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
  late DateTime createdAt;
  late String business;
  late String sync; // new, update, sync
  late String async;


  CartModel(
      {this.id,
      required this.idProductCart,
      required this.quantityCart,
      required this.priceCart,
      required this.priceAchatUnit,
      required this.unite,
      required this.tva,
      required this.remise,
      required this.qtyRemise,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.createdAt,
      required this.business,
    required this.sync,
    required this.async,
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
        succursale: row[9],
        signature: row[10],
        created: row[11],
        createdAt: row[12],
        business: row[13],
        sync: row[14],
        async: row[15]);
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
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        createdAt: DateTime.parse(json['createdAt']),
        business: json['business'],
      sync: json['sync'],
      async: json['async'],
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
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }

  
}
