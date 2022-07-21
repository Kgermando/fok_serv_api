class FactureCartModel {
  late int? id;
  late String cart;
  late String client;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;

  FactureCartModel(
      {this.id,
      required this.cart,
      required this.client,
      required this.succursale,
      required this.signature,
      required this.created});

  factory FactureCartModel.fromSQL(List<dynamic> row) {
    return FactureCartModel(
        id: row[0],
        cart: row[1],
        client: row[2],
        succursale: row[3],
        signature: row[4],
        created: row[5]);
  }

  factory FactureCartModel.fromJson(Map<String, dynamic> json) {
    return FactureCartModel(
        id: json['id'],
        cart: json['cart'],
        client: json['client'],
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart': cart,
      'client': client,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
