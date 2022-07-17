class LigneBudgetaireModel {
  late int? id;
  late String nomLigneBudgetaire;
  late String departement;
  late String periodeBudget;
  late String uniteChoisie;
  late String nombreUnite;
  late String coutUnitaire;
  late String coutTotal;
  late String caisse;
  late String banque; 
  late String finExterieur;  // Reste à trouver
  late String signature;
  late DateTime created;

  LigneBudgetaireModel(
      {this.id,
      required  this.nomLigneBudgetaire,
      required  this.departement,
      required  this.periodeBudget,
      required  this.uniteChoisie,
      required  this.nombreUnite,
      required  this.coutUnitaire,
      required  this.coutTotal,
      required  this.caisse,
      required  this.banque, 
      required  this.finExterieur,
      required this.signature,
      required this.created
  });

  factory LigneBudgetaireModel.fromSQL(List<dynamic> row) {
    return LigneBudgetaireModel(
      id: row[0],
      nomLigneBudgetaire: row[1],
      departement: row[2],
      periodeBudget: row[3],
      uniteChoisie: row[4],
      nombreUnite: row[5],
      coutUnitaire: row[6],
      coutTotal: row[7],
      caisse: row[8],
      banque: row[9],
      finExterieur: row[10],
      signature: row[11],
      created: row[12]
    );
  }

  factory LigneBudgetaireModel.fromJson(Map<String, dynamic> json) {
    return LigneBudgetaireModel(
      id: json['id'],
      nomLigneBudgetaire: json['nomLigneBudgetaire'],
      departement: json['departement'],
      periodeBudget: json['periodeBudget'],
      uniteChoisie: json['uniteChoisie'],
      nombreUnite: json['nombreUnite'],
      coutUnitaire: json['coutUnitaire'],
      coutTotal: json['coutTotal'],
      caisse: json['caisse'],
      banque: json['banque'], 
      finExterieur: json['finExterieur'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomLigneBudgetaire': nomLigneBudgetaire,
      'departement': departement,
      'periodeBudget': periodeBudget,
      'uniteChoisie': uniteChoisie,
      'nombreUnite': nombreUnite,
      'coutUnitaire': coutUnitaire,
      'coutTotal': coutTotal,
      'caisse': caisse,
      'banque': banque, 
      'finExterieur': finExterieur,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }

}
