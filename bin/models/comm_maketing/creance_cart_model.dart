class CreanceCartModel {
  late int? id;
  late String cart;
  late String client;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;

  CreanceCartModel(
      {this.id,
      required this.cart,
      required this.client,
      required this.succursale,
      required this.signature,
      required this.created});

  factory CreanceCartModel.fromSQL(List<dynamic> row) {
    return CreanceCartModel(
        id: row[0],
        cart: row[1],
        client: row[2],
        succursale: row[3],
        signature: row[4],
        created: row[5]);
  }

  factory CreanceCartModel.fromJson(Map<String, dynamic> json) {
    return CreanceCartModel(
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
