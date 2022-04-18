class CreanceCartModel {
  final int? id;
  final List cart;
  final String client;
  final DateTime created;
  final String telephone;
  final String succursale;
  final String nameBusiness;

  const CreanceCartModel(
      {this.id,
      required this.cart,
      required this.client,
      required this.created,
      required this.telephone,
      required this.succursale,
      required this.nameBusiness});

  factory CreanceCartModel.fromSQL(List<dynamic> row) {
    return CreanceCartModel(
      id: row[0],
      cart: row[1],
      client: row[2],
      created: row[3],
      telephone: row[4],
      succursale: row[5],
      nameBusiness: row[6],
    );
  }

  factory CreanceCartModel.fromJson(Map<String, dynamic> json) {
    return CreanceCartModel(
      id: json['id'],
      cart: json['cart'],
      client: json['client'],
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
    );
  }

  // CreanceCartModel.fromDatabase(RecordSnapshot<int, Map<String, dynamic>> snapshot)
  //   : id = snapshot.key,
  //     cart = snapshot.value['cart'] as List,
  //     client = snapshot.value['client'] as String,
  //     date = DateTime.parse(snapshot.value['date'] as String),
  //     telephone = snapshot.value['telephone'] as String,
  //     succursale = snapshot.value['succursale'] as String,
  //     nameBusiness = snapshot.value['nameBusiness'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cart': cart,
      'client': client,
      'created': created.toIso8601String(),
      'telephone': telephone,
      "succursale": succursale,
      'nameBusiness': nameBusiness,
    };
  }
}
