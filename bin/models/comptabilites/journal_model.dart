class JournalModel {
  late int? id;
  late String numeroOperation;
  late String libele;
  late String compteDebit;
  late String montantDebit; // Montant
  late String compteCredit;
  late String montantCredit; // TVA
  late String tva;
  late String remarque;

  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature;
  late DateTime created;

  JournalModel(
      {this.id,
      required this.numeroOperation,
      required this.libele,
      required this.compteDebit,
      required this.montantDebit,
      required this.compteCredit,
      required this.montantCredit,
      required this.tva,
      required this.remarque,
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created}); 

  factory JournalModel.fromSQL(List<dynamic> row) {
    return JournalModel(
        id: row[0],
        numeroOperation: row[1],
        libele: row[2],
        compteDebit: row[3],
        montantDebit: row[4],
        compteCredit: row[5],
        montantCredit: row[6],
        tva: row[7],
        remarque: row[8],
        approbationDG: row[9],
        signatureDG: row[10],
        signatureJustificationDG: row[11],
        approbationDD: row[12],
        signatureDD: row[13],
        signatureJustificationDD: row[14],
        signature: row[15],
        created: row[16]);
  }

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
        id: json['id'],
        numeroOperation: json['numeroOperation'],
        libele: json['libele'],
        compteDebit: json['compteDebit'],
        montantDebit: json['montantDebit'],
        compteCredit: json['compteCredit'],
        montantCredit: json['montantCredit'],
        tva: json['tva'],
        remarque: json['remarque'],
        approbationDG: json['approbationDG'],
        signatureDG: json['signatureDG'],
        signatureJustificationDG: json['signatureJustificationDG'],
        approbationDD: json['approbationDD'],
        signatureDD: json['signatureDD'],
        signatureJustificationDD: json['signatureJustificationDD'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numeroOperation': numeroOperation,
      'libele': libele,
      'compteDebit': compteDebit,
      'montantDebit': montantDebit,
      'compteCredit': compteCredit,
      'montantCredit': montantCredit,
      'tva': tva,
      'remarque': remarque,
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
