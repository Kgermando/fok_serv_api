class AmortissementModel {
  late int? id;
  late String titleArmotissement;
  late String comptes;
  late String intitule;
  late String montant;
  late String typeJournal; // Debit ou Credit
  late DateTime created;

  AmortissementModel(
      {this.id,
      required this.titleArmotissement,
      required this.comptes,
      required this.intitule,
      required this.montant,
      required this.typeJournal,
      required this.created});
 
  factory AmortissementModel.fromSQL(List<dynamic> row) {
    return AmortissementModel(
        id: row[0],
        titleArmotissement: row[1],
        comptes: row[2],
        intitule: row[3],
        montant: row[4],
        typeJournal: row[5],
        created: row[6]);
  }

  factory AmortissementModel.fromJson(Map<String, dynamic> json) {
    return AmortissementModel(
      id: json['id'],
      titleArmotissement: json['titleArmotissement'],
      comptes: json['comptes'],
      intitule: json['intitule'],
      montant: json['montant'],
      typeJournal: json['typeJournal'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleArmotissement': titleArmotissement,
      'comptes': comptes,
      'intitule': intitule,
      'montant': montant,
      'typeJournal': typeJournal,
      'created': created.toIso8601String(),
    };
  }
}
