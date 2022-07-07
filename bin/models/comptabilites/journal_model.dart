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

  late String signature;
  late DateTime createdRef;
  late DateTime created; // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

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
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD}); 

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
        signature: row[9],
        createdRef: row[10],
        created: row[11],
        approbationDG: row[12],
        motifDG: row[13],
        signatureDG: row[14],
        approbationDD: row[15],
        motifDD: row[16],
        signatureDD: row[17]);
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
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
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
      'numeroOperation': numeroOperation,
      'libele': libele,
      'compteDebit': compteDebit,
      'montantDebit': montantDebit,
      'compteCredit': compteCredit,
      'montantCredit': montantCredit,
      'tva': tva,
      'remarque': remarque,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
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
