class RestitutionModel {
  late int? id;
  late String idProduct;
  late String quantity;
  late String unite;
  late String firstName;
  late String lastName;
  late bool accuseReception;
  late String accuseReceptionFirstName;
  late String accuseReceptionLastName;
  late String role;
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationFin;
  late String signatureFin;
  late String signatureJustificationFin;

  late String approbationBudget;
  late String signatureBudget;
  late String signatureJustificationBudget;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
 
  RestitutionModel({
    this.id,
    required this.idProduct,
    required this.quantity,
    required this.unite,
    required this.firstName,
    required this.lastName,
    required this.accuseReception,
    required this.accuseReceptionFirstName,
    required this.accuseReceptionLastName,
    required this.role,
    required this.approbationDG,
    required this.signatureDG,
    required this.signatureJustificationDG,
    required this.approbationFin,
    required this.signatureFin,
    required this.signatureJustificationFin,
    required this.approbationBudget,
    required this.signatureBudget,
    required this.signatureJustificationBudget,
    required this.approbationDD,
    required this.signatureDD,
    required this.signatureJustificationDD,
    required this.succursale,
    required this.signature,
    required this.created
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
      approbationDG: row[10],
      signatureDG: row[11],
      signatureJustificationDG: row[12],
      approbationFin: row[13],
      signatureFin: row[14],
      signatureJustificationFin: row[15],
      approbationBudget: row[16],
      signatureBudget: row[17],
      signatureJustificationBudget: row[18],
      approbationDD: row[19],
      signatureDD: row[20],
      signatureJustificationDD: row[21],
      succursale: row[22],
      signature: row[23],
      created: row[24]
    );
  }

  factory RestitutionModel.fromJson(Map<String, dynamic> json) {
    return RestitutionModel(
      id: json['id'],
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      unite: json['unite'],
      firstName: json["firstName"],
      lastName: json["lastName"],
      accuseReception: json["accuseReception"],
      accuseReceptionFirstName: json["accuseReceptionFirstName"],
      accuseReceptionLastName: json["accuseReceptionLastName"],
      role: json["role"],
      approbationDG: json['approbationDG'],
      signatureDG: json['signatureDG'],
      signatureJustificationDG: json['signatureJustificationDG'],
      approbationFin: json['approbationFin'],
      signatureFin: json['signatureFin'],
      signatureJustificationFin: json['signatureJustificationFin'],
      approbationBudget: json['approbationBudget'],
      signatureBudget: json['signatureBudget'],
      signatureJustificationBudget: json['signatureJustificationBudget'],
      approbationDD: json['approbationDD'],
      signatureDD: json['signatureDD'],
      signatureJustificationDD: json['signatureJustificationDD'],
      succursale: json['succursale'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idProduct': idProduct,
      'quantity': quantity,
      "firstName": firstName,
      "lastName": lastName,
      "accuseReception": accuseReception,
      "accuseReceptionFirstName": accuseReceptionFirstName,
      "accuseReceptionLastName": accuseReceptionLastName,
      "role": role,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationFin': approbationFin,
      'signatureFin': signatureFin,
      'signatureJustificationFin': signatureJustificationFin,
      'approbationBudget': approbationBudget,
      'signatureBudget': signatureBudget,
      'signatureJustificationBudget': signatureJustificationBudget,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}