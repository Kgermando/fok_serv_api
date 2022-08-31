class CompteBilanRefModel {
  late int? id;
  late int reference;
  late String comptes;
  late String montant;
  late String type;

  CompteBilanRefModel({
    this.id,
    required this.reference, 
    required this.comptes, 
    required this.montant,
    required this.type
  });

  factory CompteBilanRefModel.fromSQL(List<dynamic> row) {
    return CompteBilanRefModel(
      id: row[0],
      reference: row[1],
      comptes: row[2],
      montant: row[3],
      type: row[4]
    );
  } 

  factory CompteBilanRefModel.fromJson(Map<String, dynamic> json) {
    return CompteBilanRefModel(
      id: json['id'],
      reference: json['reference'],
      comptes: json['comptes'], 
      montant: json['montant'],
      type: json['type']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'comptes': comptes,
      'montant': montant,
      'type': type
    };
  }
}
