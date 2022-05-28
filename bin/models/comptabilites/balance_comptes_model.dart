class BalanceCompteModel {
  late int? id;
  late String title;
  late List comptes;
  late bool statut; // A defaut de modifier il vont déclaser le fichier

  late String signature;
  late DateTime created;

  BalanceCompteModel(
      {this.id,
      required this.title,
      required this.comptes,
      required this.statut,
      required this.signature,
      required this.created});

  factory BalanceCompteModel.fromSQL(List<dynamic> row) {
    return BalanceCompteModel(
      id: row[0],
      title: row[1],
      comptes: row[2],
      statut: row[3],
      signature: row[4],
      created: row[5]
    );
  }

  factory BalanceCompteModel.fromJson(Map<String, dynamic> json) {
    return BalanceCompteModel(
        id: json['id'],
        title: json['title'],
        comptes: json['comptes'],
        statut: json['statut'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'comptes': comptes,
      'statut': statut,
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
