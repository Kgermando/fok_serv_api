class CartModel {
  late int? id;
  late String idProductCart;
  late String quantityCart;
  late String priceCart;
  late String priceAchatUnit;
  late String unite;
  late DateTime created;
  late String telephone;
  late String succursale;
  late String nameBusiness;
  late String tva;
  late String remise;
  late String qtyRemise;

  CartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceCart,
    required this.priceAchatUnit,
    required this.unite,
    required this.created,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.tva,
    required this.remise,
    required this.qtyRemise
  });

  factory CartModel.fromSQL(List<dynamic> row) {
    return CartModel(
      id: row[0],
      idProductCart: row[1],
      quantityCart: row[2],
      priceCart: row[3],
      priceAchatUnit: row[4],
      unite: row[5],
      created: row[6],
      telephone: row[7],
      succursale: row[8],
      nameBusiness: row[9],
      tva: row[10],
      remise: row[11],
      qtyRemise: row[12]
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
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
      tva: json["tva"],
      remise: json["remise"],
      qtyRemise: json["qtyRemise"]
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
      'created': created.toIso8601String(),
      'telephone': telephone,
      "succursale": succursale,
      'nameBusiness': nameBusiness,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise
    };
  }
}
