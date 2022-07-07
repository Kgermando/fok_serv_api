class BilanModel {
  late int? id;
  late String titleBilan;
  late String signature;
  late DateTime createdRef;
  late DateTime created;
  late String isSubmit;

    // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;


  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.signature,
    required this.createdRef,
    required this.created,
      required this.isSubmit,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD
  });

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      signature: row[2],
      createdRef: row[3],
      created: row[4],
        isSubmit: row[5],
        approbationDG: row[6],
        motifDG: row[7],
        signatureDG: row[8],
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]
    );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      signature: json['signature'],
      createdRef: DateTime.parse(json['createdRef']),
      created: DateTime.parse(json['created']),
      isSubmit: json['isSubmit'],
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
      'titleBilan': titleBilan,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'isSubmit': isSubmit,
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD
    };
  }
}