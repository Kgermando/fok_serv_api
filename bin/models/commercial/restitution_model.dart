class RestitutionModel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String unite;
  late String firstName;
  late String lastName;
  late String accuseReception;
  late String accuseReceptionFirstName;
  late String accuseReceptionLastName;
  late String role;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  RestitutionModel(
      {this.id,
      required this.idProduct,
      required this.quantity,
      required this.unite,
      required this.firstName,
      required this.lastName,
      required this.accuseReception,
      required this.accuseReceptionFirstName,
      required this.accuseReceptionLastName,
      required this.role,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory RestitutionModel.fromSQL(List<dynamic> row) {
    return RestitutionModel(
        id: row[0],
        idProduct: row[1],
        quantity: row[2],
        unite: row[3],
        firstName: row[4],
        lastName: row[5],
        accuseReception: row[6],
        accuseReceptionFirstName: row[7],
        accuseReceptionLastName: row[8],
        role: row[9],
        succursale: row[10],
        signature: row[11],
        created: row[12],
        business: row[13],
        sync: row[14],
        async: row[15]);
  }

  factory RestitutionModel.fromJson(Map<String, dynamic> json) {
    return RestitutionModel(
        id: json['id'],
        idProduct: json['idProduct'],
        quantity: json['quantity'],
        unite: json['unite'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        accuseReception: json['accuseReception'],
        accuseReceptionFirstName: json['accuseReceptionFirstName'],
        accuseReceptionLastName: json['accuseReceptionLastName'],
        role: json['role'],
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        business: json['business'],
      sync: json['sync'],
      async: json['async'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idProduct': idProduct,
      'quantity': quantity,
      'unite': unite,
      "firstName": firstName,
      "lastName": lastName,
      "accuseReception": accuseReception.toString(),
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName,
      "role": role,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }
}
