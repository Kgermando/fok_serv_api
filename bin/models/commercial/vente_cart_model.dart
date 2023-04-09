class VenteCartModel {
  late int? id;
  late String idProductCart;
  late String quantityCart;
  late String priceTotalCart;
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

  VenteCartModel(
      {this.id,
      required this.idProductCart,
      required this.quantityCart,
      required this.priceTotalCart,
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

  factory VenteCartModel.fromSQL(List<dynamic> row) {
    return VenteCartModel(
        id: row[0],
        idProductCart: row[1],
        quantityCart: row[2],
        priceTotalCart: row[3],
        unite: row[4],
        tva: row[5],
        remise: row[6],
        qtyRemise: row[7],
        succursale: row[8],
        signature: row[9],
        created: row[10],
        createdAt: row[11],
        business: row[12],
        sync: row[13],
        async: row[14]);
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
      'priceTotalCart': priceTotalCart,
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
