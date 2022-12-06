class ImmobilierModel {
  late int? id;
  late String typeAllocation;
  late String adresse;
  late String numeroCertificat;
  late String superficie;
  late DateTime dateAcquisition;

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

  ImmobilierModel(
      {this.id,
      required this.typeAllocation,
      required this.adresse,
      required this.numeroCertificat,
      required this.superficie,
      required this.dateAcquisition,
      required this.signature,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory ImmobilierModel.fromSQL(List<dynamic> row) {
    return ImmobilierModel(
        id: row[0],
        typeAllocation: row[1],
        adresse: row[2],
        numeroCertificat: row[3],
        superficie: row[4],
        dateAcquisition: row[5],
        signature: row[6],
        created: row[7],
        approbationDG: row[8],
        motifDG: row[9],
        signatureDG: row[10],
        approbationDD: row[11],
        motifDD: row[12],
        signatureDD: row[13]);
  }

  factory ImmobilierModel.fromJson(Map<String, dynamic> json) {
    return ImmobilierModel(
        id: json['id'],
        typeAllocation: json['typeAllocation'],
        adresse: json['adresse'],
        numeroCertificat: json['numeroCertificat'],
        superficie: json['superficie'],
        dateAcquisition: DateTime.parse(json['dateAcquisition']),
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typeAllocation': typeAllocation,
      'adresse': adresse,
      'numeroCertificat': numeroCertificat,
      'superficie': superficie,
      'dateAcquisition': dateAcquisition.toIso8601String(),
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
