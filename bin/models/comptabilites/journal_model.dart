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
      required this.signature,
      required this.createdRef,
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
        signature: row[9],
        createdRef: row[10],
        created: row[11]);
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
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}
