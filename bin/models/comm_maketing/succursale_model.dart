class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String province;
  late String signature; // celui qui fait le document
  late DateTime created;
    // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.province,
    required this.signature,
    required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      province: row[3],
      signature: row[4],
      created: row[5],
        approbationDG: row[6],
        motifDG: row[7],
        signatureDG: row[8],
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      province: json['province'],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'province': province,
      'signature': signature,
      'created': created.toIso8601String(),
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}