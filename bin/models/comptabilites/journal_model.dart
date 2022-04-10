class JournalModel {
  late int? id;
  late String titleBilan;
  late String comptes;
  late String intitule;
  late String montant;
  late String typeJournal; // Debit ou Credit
  late DateTime created;
  late String signature;

  JournalModel(
      {this.id,
      required this.titleBilan,
      required this.comptes,
      required this.intitule,
      required this.montant,
      required this.typeJournal,
      required this.created,
    required this.signature,
  });

  factory JournalModel.fromSQL(List<dynamic> row) {
    return JournalModel(
      id: row[0],
      titleBilan: row[1],
      comptes: row[2],
      intitule: row[3],
      montant: row[4],
      typeJournal: row[5],
      created: row[6],
      signature: row[7]
    );
  }

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      comptes: json['comptes'],
      intitule: json['intitule'],
      montant: json['montant'],
      typeJournal: json['typeJournal'],
      created: DateTime.parse(json['created']),
        signature: json['signature']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleBilan': titleBilan,
      'comptes': comptes,
      'intitule': intitule,
      'montant': montant,
      'typeJournal': typeJournal,
      'created': created.toIso8601String(),
      'signature': signature,
    };
  }
}
