class BilanModel {
  late int? id;
  late String titleBilan;
  late String comptes;
  late String intitule;
  late String montant;
  late String typeBilan; // Actif ou Passif
  late DateTime created;
  late String signature;

  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.comptes, 
    required this.intitule, 
    required this.montant, 
    required this.typeBilan, 
    required this.created,
    required this.signature,
  });

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      comptes: row[2],
      intitule: row[3],
      montant: row[4],
      typeBilan: row[5],
      created: row[6],
      signature: row[7]
    );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      comptes: json['comptes'],
      intitule: json['intitule'],
      montant: json['montant'],
      typeBilan: json['typeBilan'],
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
      'typeBilan': typeBilan,
      'created': created.toIso8601String(),
      'signature': signature,
    };
  }
}