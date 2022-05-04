class BalanceCompteModel {
  late int? id;
  // Debit, credit,
  late List comptes;
  late bool statut; // A defaut de modifier il vont déclaser le fichier


  late String approbationDG; // button radio OUi et NON if non text field
  late String signatureDG;
  late String signatureJustificationDG;

  late String approbationDD;
  late String signatureDD; // directeur de departement
  late String signatureJustificationDD;

  late String signature;
  late DateTime created;

  BalanceCompteModel(
      {this.id,
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
        comptes: row[1],
        statut: row[2],
        approbationDG: row[3],
        signatureDG: row[4],
        signatureJustificationDG: row[5],
        approbationDD: row[6],
        signatureDD: row[7],
        signatureJustificationDD: row[7],
        signature: row[9],
        created: row[10]);
  }

  factory BalanceCompteModel.fromJson(Map<String, dynamic> json) {
    return BalanceCompteModel(
        id: json['id'],
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
