class StocksGlobalMOdel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String quantityAchat;
  late String priceAchatUnit;
  late String prixVenteUnit;
  late String unite;
  late String modeAchat;
  late String tva;
  late String qtyRavitailler;
  late String signature; // celui qui fait le document
  late DateTime created;

  StocksGlobalMOdel(
      {this.id,
      required this.idProduct,
      required this.quantity,
      required this.quantityAchat,
      required this.priceAchatUnit,
      required this.prixVenteUnit,
      required this.unite,
      required this.modeAchat,
      required this.tva,
      required this.qtyRavitailler,
      required this.signature,
      required this.created});

  factory StocksGlobalMOdel.fromSQL(List<dynamic> row) {
    return StocksGlobalMOdel(
        id: row[0],
        idProduct: row[1],
        quantity: row[2],
        quantityAchat: row[3],
        priceAchatUnit: row[4],
        prixVenteUnit: row[5],
        unite: row[6],
        modeAchat: row[7],
        tva: row[8],
        qtyRavitailler: row[9],
        signature: row[10],
        created: row[11]);
  }

  factory StocksGlobalMOdel.fromJson(Map<String, dynamic> json) {
    return StocksGlobalMOdel(
        id: json['id'],
        idProduct: json['idProduct'],
        quantity: json['quantity'],
        quantityAchat: json['quantityAchat'],
        priceAchatUnit: json['priceAchatUnit'],
        prixVenteUnit: json['prixVenteUnit'],
        unite: json['unite'],
        modeAchat: json['modeAchat'],
        tva: json["tva"],
        qtyRavitailler: json["qtyRavitailler"],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
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
      'modeAchat': modeAchat.toString(),
      "tva": tva,
      "qtyRavitailler": qtyRavitailler,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
