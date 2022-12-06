class ApprovisionnementModel {
  late int? id;
  late String provision;
  late String quantityTotal;
  late String quantity;
  late String unite;
  late String signature;
  late DateTime created;
  late String fournisseur;

  ApprovisionnementModel(
      {this.id,
      required this.provision,
      required this.quantityTotal,
      required this.quantity,
      required this.unite,
      required this.signature,
      required this.created,
      required this.fournisseur});

  factory ApprovisionnementModel.fromSQL(List<dynamic> row) {
    return ApprovisionnementModel(
      id: row[0],
      provision: row[1],
      quantityTotal: row[2],
      quantity: row[3],
      unite: row[4],
      signature: row[5],
      created: row[6],
      fournisseur: row[7],
    );
  }

  factory ApprovisionnementModel.fromJson(Map<String, dynamic> json) {
    return ApprovisionnementModel(
        id: json['id'],
        provision: json['provision'],
        quantityTotal: json['quantityTotal'],
        quantity: json['quantity'],
        unite: json['unite'],
        signature: json["signature"],
        created: DateTime.parse(json['created']),
        fournisseur: json["fournisseur"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'provision': provision,
      'quantityTotal': quantityTotal,
      'quantity': quantity,
      'unite': unite,
      'signature': signature,
      'created': created.toIso8601String(),
      'fournisseur': fournisseur,
    };
  }
}
