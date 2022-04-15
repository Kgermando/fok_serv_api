class ImmobilierModel {
  late int? id;
  late String typeAllocation;
  late String adresse;
  late String numeroCertificat;
  late String superficie;
  late DateTime dateAcquisition;
  late DateTime created;
  late String signature;

  ImmobilierModel(
      {this.id,
      required this.typeAllocation,
      required this.adresse,
      required this.numeroCertificat,
      required this.superficie,
      required this.dateAcquisition,
      required this.created,
      required this.signature});

  factory ImmobilierModel.fromSQL(List<dynamic> row) {
    return ImmobilierModel(
        id: row[0],
        typeAllocation: row[1],
        adresse: row[2],
        numeroCertificat: row[3],
        superficie: row[4],
        dateAcquisition: row[5],
        created: row[6],
        signature: row[7]);
  }

  factory ImmobilierModel.fromJson(Map<String, dynamic> json) {
    return ImmobilierModel(
        id: json['id'],
        typeAllocation: json['typeAllocation'],
        adresse: json['adresse'],
        numeroCertificat: json['numeroCertificat'],
        superficie: json['superficie'],
        dateAcquisition: DateTime.parse(json['dateAcquisition']),
        created: DateTime.parse(json['created']),
        signature: json['signature']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typeAllocation': typeAllocation,
      'adresse': adresse,
      'numeroCertificat': numeroCertificat,
      'superficie': superficie,
      'dateAcquisition': dateAcquisition.toIso8601String(),
      'created': created.toIso8601String(),
      'signature': signature
    };
  }
}
