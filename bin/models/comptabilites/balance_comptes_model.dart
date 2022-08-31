class BalanceCompteModel {
  late int? id;
  late String title;
  late String statut; // A defaut de modifier il vont déclaser le fichier
  late String signature;
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

  BalanceCompteModel(
      {this.id,
      required this.title,
      required this.statut,
      required this.signature,
      required this.created,
      required this.isSubmit,
      required this.approbationDG,
      required this.motifDG,
      required this.signatureDG,
      required this.approbationDD,
      required this.motifDD,
      required this.signatureDD});

  factory BalanceCompteModel.fromSQL(List<dynamic> row) {
    return BalanceCompteModel(
        id: row[0],
        title: row[1],
        statut: row[2],
        signature: row[3],
        created: row[4],
        isSubmit: row[5],
        approbationDG: row[6],
        motifDG: row[7],
        signatureDG: row[8],
        approbationDD: row[9],
        motifDD: row[10],
        signatureDD: row[11]);
  }

  factory BalanceCompteModel.fromJson(Map<String, dynamic> json) {
    return BalanceCompteModel(
        id: json['id'],
        title: json['title'],
        statut: json['statut'],
        signature: json['signature'],
        created: DateTime.parse(json['created']),
        isSubmit: json['isSubmit'],
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
      'title': title,
      'statut': statut,
      'signature': signature,
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

class CompteBalanceRefModel {
  late int? id;
  late int reference;
  late String comptes;
  late String debit;
  late String credit;
  late String solde;

  CompteBalanceRefModel(
      {this.id,
      required this.reference,
      required this.comptes,
      required this.debit,
      required this.credit,
      required this.solde});

  factory CompteBalanceRefModel.fromSQL(List<dynamic> row) {
    return CompteBalanceRefModel(
        id: row[0],
        reference: row[1],
        comptes: row[2],
        debit: row[3],
        credit: row[4],
        solde: row[5]);
  }

  factory CompteBalanceRefModel.fromJson(Map<String, dynamic> json) {
    return CompteBalanceRefModel(
        id: json['id'],
        reference: json['reference'],
        comptes: json['comptes'],
        debit: json['debit'],
        credit: json['credit'],
        solde: json['solde']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'comptes': comptes,
      'debit': debit,
      'credit': credit,
      'solde': solde
    };
  }
}
