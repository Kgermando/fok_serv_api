class RestitutionModel {
  final int? id;
  final String idProduct;
  final String quantity;
  final String unite;
  final DateTime created;
  final String firstName;
  final String lastName;
  final String telephone;
  final String succursale;
  final String nameBusiness;
  final bool accuseReception;
  final String accuseReceptionFirstName;
  final String accuseReceptionLastName;
  final String role;

  const RestitutionModel({
    this.id,
    required this.idProduct,
    required this.quantity,
    required this.unite,
    required this.created,
    required this.firstName,
    required this.lastName,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness,
    required this.accuseReception,
    required this.accuseReceptionFirstName,
    required this.accuseReceptionLastName,
    required this.role
  });

  factory RestitutionModel.fromSQL(List<dynamic> row) {
    return RestitutionModel(
      id: row[0],
      idProduct: row[1],
      quantity: row[2],
      unite: row[3],
      created: row[4],
      firstName: row[5],
      lastName: row[6],
      telephone: row[7],
      succursale: row[8],
      nameBusiness: row[9],
      accuseReception: row[10],
      accuseReceptionFirstName: row[11],
      accuseReceptionLastName: row[12],
      role: row[12],
    );
  }

  factory RestitutionModel.fromJson(Map<String, dynamic> json) {
    return RestitutionModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      unite: json['unite'],
      created: DateTime.parse(json['created']),
      firstName: json["firstName"],
      lastName: json["lastName"],
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"],
      accuseReception: json["accuseReception"],
      accuseReceptionFirstName: json["accuseReceptionFirstName"],
      accuseReceptionLastName: json["accuseReceptionLastName"],
      role: json["role"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idProduct': idProduct,
      'quantity': quantity,
      'created': created.toIso8601String(),
      "firstName": firstName,
      "lastName": lastName,
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
      "accuseReception": accuseReception,
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName,
       "role": role
    };
  }
}