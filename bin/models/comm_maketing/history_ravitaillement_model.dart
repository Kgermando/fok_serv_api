
class HistoryRavitaillementModel {
  final int? id;
  final String idProduct;
  final String quantity;
  final String quantityAchat;
  final String priceAchatUnit;
  final String prixVenteUnit;
  final String unite;
  final String margeBen;
  final DateTime created;
  final String telephone;
  final String succursale;
  final String nameBusiness;
  final String tva;
  final String qtyRavitailler;

  HistoryRavitaillementModel({
    this.id, 
    required this.idProduct, 
    required this.quantity, 
    required this.quantityAchat, 
    required this.priceAchatUnit, 
    required this.prixVenteUnit, 
    required this.unite, 
    required this.margeBen, 
    required this.created, 
    required this.telephone, 
    required this.succursale, 
    required this.nameBusiness,
    required this.tva,
    required this.qtyRavitailler
  });


  factory HistoryRavitaillementModel.fromSQL(List<dynamic> row) {
    return HistoryRavitaillementModel(
      id: row[0],
      idProduct: row[1],
      quantity: row[2],
      quantityAchat: row[3],
      priceAchatUnit: row[4],
      prixVenteUnit: row[5],
      unite: row[6],
      margeBen: row[7],
      created: row[8],
      telephone: row[9],
      succursale: row[10],
      nameBusiness: row[11],
      tva: row[12],
      qtyRavitailler: row[13]
    );
  }

  factory HistoryRavitaillementModel.fromJson(Map<String, dynamic> json) {
    return HistoryRavitaillementModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      quantityAchat: json['quantityAchat'],
      priceAchatUnit: json['priceAchatUnit'],
      prixVenteUnit: json['prixVenteUnit'],
      unite: json['unite'],
      margeBen: json['margeBen'],
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
      tva: json["tva"],
      qtyRavitailler: json["qtyRavitailler"]
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
      'created': created.toIso8601String(),
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
      "tva": tva,
      "qtyRavitailler": qtyRavitailler
    };
  }

}