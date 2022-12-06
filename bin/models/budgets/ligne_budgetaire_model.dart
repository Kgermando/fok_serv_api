class LigneBudgetaireModel {
  late int? id;
  late String nomLigneBudgetaire;
  late String departement;
  late DateTime periodeBudgetDebut;
  late DateTime periodeBudgetFin;
  late String uniteChoisie;
  late String nombreUnite;
  late String coutUnitaire;
  late String coutTotal;
  late String caisse;
  late String banque;
  late String finExterieur; // Reste à trouver
  late String signature;
  late DateTime created;
  late int reference;
  late double caisseSortie;
  late double banqueSortie;
  late double finExterieurSortie;

  LigneBudgetaireModel(
      {this.id,
      required this.nomLigneBudgetaire,
      required this.departement,
      required this.periodeBudgetDebut,
      required this.periodeBudgetFin,
      required this.uniteChoisie,
      required this.nombreUnite,
      required this.coutUnitaire,
      required this.coutTotal,
      required this.caisse,
      required this.banque,
      required this.finExterieur,
      required this.signature,
      required this.created,
      required this.reference,
      required this.caisseSortie,
      required this.banqueSortie,
      required this.finExterieurSortie});

  factory LigneBudgetaireModel.fromSQL(List<dynamic> row) {
    return LigneBudgetaireModel(
        id: row[0],
        nomLigneBudgetaire: row[1],
        departement: row[2],
        periodeBudgetDebut: row[3],
        periodeBudgetFin: row[4],
        uniteChoisie: row[5],
        nombreUnite: row[6],
        coutUnitaire: row[7],
        coutTotal: row[8],
        caisse: row[9],
        banque: row[10],
        finExterieur: row[11],
        signature: row[12],
        created: row[13],
        reference: row[14],
        caisseSortie: row[15],
        banqueSortie: row[16],
        finExterieurSortie: row[17]);
  }

  factory LigneBudgetaireModel.fromJson(Map<String, dynamic> json) {
    return LigneBudgetaireModel(
      id: json['id'],
      nomLigneBudgetaire: json['nomLigneBudgetaire'],
      departement: json['departement'],
      periodeBudgetDebut: DateTime.parse(json['periodeBudgetDebut']),
      periodeBudgetFin: DateTime.parse(json['periodeBudgetFin']),
      uniteChoisie: json['uniteChoisie'],
      nombreUnite: json['nombreUnite'],
      coutUnitaire: json['coutUnitaire'],
      coutTotal: json['coutTotal'],
      caisse: json['caisse'],
      banque: json['banque'],
      finExterieur: json['finExterieur'],
      signature: json['signature'],
      created: DateTime.parse(json['created']),
      reference: json['reference'],
      caisseSortie: json['caisseSortie'],
      banqueSortie: json['banqueSortie'],
      finExterieurSortie: json['finExterieurSortie'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomLigneBudgetaire': nomLigneBudgetaire,
      'departement': departement,
      'periodeBudgetDebut': periodeBudgetDebut.toIso8601String(),
      'periodeBudgetFin': periodeBudgetFin.toIso8601String(),
      'uniteChoisie': uniteChoisie,
      'nombreUnite': nombreUnite,
      'coutUnitaire': coutUnitaire,
      'coutTotal': coutTotal,
      'caisse': caisse,
      'banque': banque,
      'finExterieur': finExterieur,
      'signature': signature,
      'created': created.toIso8601String(),
      'reference': reference,
      'caisseSortie': caisseSortie,
      'banqueSortie': banqueSortie,
      'finExterieurSortie': finExterieurSortie,
    };
  }
}
