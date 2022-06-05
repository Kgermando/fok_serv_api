class CompteActifModel {
  late int? id;
  late DateTime reference;
  late String comptes;
  late String montant;

  CompteActifModel({
    this.id,
    required this.reference, 
    required this.comptes, 
    required this.montant
  });

  factory CompteActifModel.fromSQL(List<dynamic> row) {
    return CompteActifModel(
      id: row[0],
      reference: row[1],
      comptes: row[2],
      montant: row[3]
    );
  } 

  factory CompteActifModel.fromJson(Map<String, dynamic> json) {
    return CompteActifModel(
      reference: DateTime.parse(json['reference']),
      comptes: json['comptes'], 
      montant: json['montant']
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference.toIso8601String(),
      'comptes': comptes,
      'montant': montant
    };
  }
}
