class BalanceModel {
  late int? id;
  late String numeroOperation;
  late String libele;
  late String comptes;
  late String debit;
  late String credit;
  late String signature;
  late DateTime created;

  BalanceModel(
      {this.id,
      required this.numeroOperation,
      required this.libele,
      required this.comptes,
      required this.debit,
      required this.credit,
      required this.signature,
      required this.created});

  factory BalanceModel.fromSQL(List<dynamic> row) {
    return BalanceModel(
        id: row[0],
        numeroOperation: row[1],
        libele: row[2],
        comptes: row[3],
        debit: row[4],
        credit: row[5],
        signature: row[6],
        created: row[7]);
  }

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      id: json['id'],
      numeroOperation: json['numeroOperation'],
      libele: json['libele'],
      comptes: json['comptes'],
      debit: json['debit'],
      credit: json['credit'],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numeroOperation': numeroOperation,
      'libele': libele,
      'comptes': comptes,
      'debit': debit,
      'credit': credit,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
 