class CartModel {
  final int? id;
  final String idProductCart;
  final String quantityCart;
  final String priceCart;
  final String priceAchatUnit;
  final String unite;
  final DateTime date;
  final String telephone;
  final String succursale;
  final String nameBusiness;
  final String tva;
  final String remise;
  final String qtyRemise;

  const CartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceCart,
    required this.priceAchatUnit,
    required this.unite,
    required this.date,
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
      date: row[6],
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
      date: DateTime.parse(json['date']),
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
      'date': date.toIso8601String(),
      'telephone': telephone,
      "succursale": succursale,
      'nameBusiness': nameBusiness,
      "tva": tva,
      "remise": remise,
      "qtyRemise": qtyRemise
    };
  }
}
