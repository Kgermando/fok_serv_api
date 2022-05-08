class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String province;
  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;
  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;
  late String signature; // celui qui fait le document
  late DateTime created;

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.province,
    required this.approbationDG,
    required this.signatureDG,
    required this.signatureJustificationDG,
    required this.approbationDD,
    required this.signatureDD,
    required this.signatureJustificationDD,
    required this.signature,
    required this.created
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      province: row[3],
      approbationDG: row[4],
      signatureDG: row[5],
      signatureJustificationDG: row[6],
      approbationDD: row[7],
      signatureDD: row[8],
      signatureJustificationDD: row[9],
      signature: row[10],
      created: row[11]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      province: json['province'],
      approbationDG: json['approbationDG'],
      signatureDG: json['signatureDG'],
      signatureJustificationDG: json['signatureJustificationDG'],
      approbationDD: json['approbationDD'],
      signatureDD: json['signatureDD'],
      signatureJustificationDD: json['signatureJustificationDD'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'province': province,
      'approbationDG': approbationDG,
      'signatureDG': signatureDG,
      'signatureJustificationDG': signatureJustificationDG,
      'approbationDD': approbationDD,
      'signatureDD': signatureDD,
      'signatureJustificationDD': signatureJustificationDD,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}