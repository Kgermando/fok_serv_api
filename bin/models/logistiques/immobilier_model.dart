class ImmobilierModel {
  late int? id;
  late String typeAllocation;
  late String adresse;
  late String numeroCertificat;
  late String superficie;
  late DateTime dateAcquisition;
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

  late String signature; // celui qui fait le document
  late DateTime created;

  ImmobilierModel(
      {this.id,
      required this.typeAllocation,
      required this.adresse,
      required this.numeroCertificat,
      required this.superficie,
      required this.dateAcquisition,
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
      required this.signature,
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
        approbationDG: row[6],
        signatureDG: row[7],
        signatureJustificationDG: row[8],
        approbationFin: row[9],
        signatureFin: row[10],
        signatureJustificationFin: row[11],
        approbationBudget: row[12],
        signatureBudget: row[13],
        signatureJustificationBudget: row[14],
        approbationDD: row[15],
        signatureDD: row[16],
        signatureJustificationDD: row[17],
        signature: row[18],
        created: row[19]

        
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
      signature: json['signature'],
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
      'signature': signature,
      'created': created.toIso8601String()

    };
  }
}
