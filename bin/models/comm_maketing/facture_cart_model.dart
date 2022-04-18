class FactureCartModel {
  late int? id;
  late List cart;
  late String client;
  late DateTime created;
  late String telephone;
  late String succursale;
  late String nameBusiness;

  FactureCartModel(
      {this.id,
      required this.cart,
      required this.client,
      required this.created,
      required this.telephone,
      required this.succursale,
      required this.nameBusiness});
 
  factory FactureCartModel.fromSQL(List<dynamic> row) {
    return FactureCartModel(
      id: row[0],
      cart: row[1],
      client: row[2],
      created: row[3],
      telephone: row[4],
      succursale: row[5],
      nameBusiness: row[6]
    );
  }

  factory FactureCartModel.fromJson(Map<String, dynamic> json) {
    return FactureCartModel(
      id: json['id'],
      cart: json['cart'],
      client: json['client'],
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"]
    );
  }

  // FactureCartModel.fromDatabase(RecordSnapshot<int, Map<String, dynamic>> snapshot)
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
