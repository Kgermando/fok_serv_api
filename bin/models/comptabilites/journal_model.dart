class JournalModel {
  late int? id;
  late String numeroOperation;
  late String libele;
  late String compteDebit;
  late String montantDebit;
  late String compteCredit;
  late String montantCredit;
  late String signature;
  late DateTime created;
  late String locker;

  JournalModel({
    this.id,
    required this.numeroOperation,
    required this.libele,
    required this.compteDebit,
    required this.montantDebit,
    required this.compteCredit,
    required this.montantCredit,
    required this.signature,
    required this.created,
    required this.locker,
  });

  factory JournalModel.fromSQL(List<dynamic> row) {
    return JournalModel(
      id: row[0],
      numeroOperation: row[1],
      libele: row[2],
      compteDebit: row[3],
      montantDebit: row[4],
      compteCredit: row[5],
      montantCredit: row[6],
      signature: row[7],
      created: row[8],
      locker: row[9]
    );
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
      signature: json['signature'],
      created: DateTime.parse(json['created']),
      locker: json['locker'],
    );
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
      'signature': signature,
      'created': created.toIso8601String(),
      'locker': locker
    };
  }
}
