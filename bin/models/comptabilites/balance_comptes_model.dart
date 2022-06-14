class BalanceCompteModel {
  late int? id;
  late String title;
  late String statut; // A defaut de modifier il vont déclaser le fichier
  late String signature;
  late DateTime createdRef;
  late DateTime created;
  late String isSubmit;

  BalanceCompteModel(
      {this.id,
      required this.title,
      required this.statut,
      required this.signature,
      required this.createdRef,
      required this.created,
      required this.isSubmit});

  factory BalanceCompteModel.fromSQL(List<dynamic> row) {
    return BalanceCompteModel(
        id: row[0],
        title: row[1],
        statut: row[2],
        signature: row[3],
        createdRef: row[4],
        created: row[5],
        isSubmit: row[6]);
  }

  factory BalanceCompteModel.fromJson(Map<String, dynamic> json) {
    return BalanceCompteModel(
      id: json['id'],
      title: json['title'],
      statut: json['statut'],
      signature: json['signature'],
      createdRef: DateTime.parse(json['createdRef']),
      created: DateTime.parse(json['created']),
      isSubmit: json['isSubmit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'statut': statut,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'isSubmit': isSubmit,
    };
  }
}

class CompteBalanceRefModel {
  late int? id;
  late DateTime reference;
  late String comptes;
  late String debit;
  late String credit;
  late double solde;

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
        reference: DateTime.parse(json['reference']),
        comptes: json['comptes'],
        debit: json['debit'],
        credit: json['credit'],
        solde: json['solde']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
      'comptes': comptes,
      'debit': debit,
      'credit': credit,
      'solde': solde
    };
  }
}
