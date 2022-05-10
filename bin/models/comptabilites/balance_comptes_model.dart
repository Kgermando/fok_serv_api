class BalanceCompteModel {
  late int? id;
  late String title;
  late List comptes;
  late bool statut; // A defaut de modifier il vont déclaser le fichier

  late String approbationDG;
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature;
  late DateTime created;

  BalanceCompteModel(
      {this.id,
      required this.title,
      required this.comptes,
      required this.statut,
      required this.approbationDG,
      required this.signatureDG,
      required this.signatureJustificationDG,
      required this.approbationDD,
      required this.signatureDD,
      required this.signatureJustificationDD,
      required this.signature,
      required this.created});

  factory BalanceCompteModel.fromSQL(List<dynamic> row) {
    return BalanceCompteModel(
      id: row[0],
      title: row[1],
      comptes: row[2],
      statut: row[3],
      approbationDG: row[4],
      signatureDG: row[5],
      signatureJustificationDG: row[6],
      approbationDD: row[7],
      signatureDD: row[8],
      signatureJustificationDD: row[9],
      signature: row[10],
      created: row[11]
    );
  }

  factory BalanceCompteModel.fromJson(Map<String, dynamic> json) {
    return BalanceCompteModel(
        id: json['id'],
        title: json['title'],
        comptes: json['comptes'],
        statut: json['statut'],
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
      'title': title,
      'comptes': comptes,
      'statut': statut,
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

class CompteBalance {
  late String comptes;
  late String debit;
  late String credit;

  CompteBalance(
      {required this.comptes, required this.debit, required this.credit});

  factory CompteBalance.fromJson(Map<String, dynamic> json) {
    return CompteBalance(
        comptes: json['comptes'], debit: json['debit'], credit: json['credit']);
  }
}
