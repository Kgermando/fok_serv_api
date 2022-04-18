class VenteCartModel {
  final int? id;
  final String idProductCart;
  final String quantityCart;
  final String priceTotalCart;
  final String unite;
  final DateTime date;
  final String telephone;
  final String succursale;
  final String nameBusiness;
  final String tva;
  final String remise;
  final String qtyRemise;

  const VenteCartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceTotalCart,
    required this.unite,
    required this.date,
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
      date: row[5],
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
      'priceTotalCart': priceTotalCart,
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
