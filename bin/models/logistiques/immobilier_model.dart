class ImmobilierModel {
  late int? id;
  late String typeAllocation;
  late String adresse;
  late String numeroCertificat;
  late String superficie;
  late DateTime dateAcquisition;

  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;

  ImmobilierModel(
      {this.id,
      required this.typeAllocation,
      required this.adresse,
      required this.numeroCertificat,
      required this.superficie,
      required this.dateAcquisition,
      required this.signature,
      required this.createdRef,
      required this.created
  });

  factory ImmobilierModel.fromSQL(List<dynamic> row) {
    return ImmobilierModel(
        id: row[0],
        typeAllocation: row[1],
        adresse: row[2],
        numeroCertificat: row[3],
        superficie: row[4],
        dateAcquisition: row[5],
        signature: row[6],
        createdRef: row[7],
        created: row[8]
    );
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
      createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created'])
    );
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
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()

    };
  }
}
