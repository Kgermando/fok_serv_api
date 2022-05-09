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

  VenteCartModel({
    this.id,
    required this.idProductCart,
    required this.quantityCart,
    required this.priceTotalCart,
    required this.unite,
    required this.tva,
    required this.remise,
    required this.qtyRemise,
      required this.succursale,
      required this.signature,
      required this.created
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
      created: row[10]
    );
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
      created: DateTime.parse(json['created'])
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
      'created': created.toIso8601String()
    };
  }
}
