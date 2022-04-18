class VenteCartModel {
  late int? id;
  late String idProductCart;
  late String quantityCart;
  late String priceTotalCart;
  late String unite;
  late DateTime created;
  late String telephone;
  late String succursale;
  late String nameBusiness;
  late String tva;
  late String remise;
  late String qtyRemise;

  VenteCartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceTotalCart,
    required this.unite,
    required this.created,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.tva,
    required this.remise,
    required this.qtyRemise
  });

  factory VenteCartModel.fromSQL(List<dynamic> row) {
    return VenteCartModel(
      id: row[0],
      idProductCart: row[1],
      quantityCart: row[2],
      priceTotalCart: row[3],
      unite: row[4],
      created: row[5],
      telephone: row[6],
      succursale: row[7],
      nameBusiness: row[8],
      tva: row[9],
      remise: row[10],
      qtyRemise: row[11]
    );
  } 
 
  factory VenteCartModel.fromJson(Map<String, dynamic> json) {
    return VenteCartModel(
      id: json['id'],
      idProductCart: json['idProductCart'],
      quantityCart: json['quantityCart'],
      priceTotalCart: json['priceTotalCart'],
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
      'priceTotalCart': priceTotalCart,
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
