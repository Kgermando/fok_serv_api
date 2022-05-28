class BilanModel {
  late int? id;
  late String titleBilan;
  late List comptesActif; // Liste des comptes
  late List comptesPactif; // Liste des comptes
  late bool statut;
  late String signature;
  late DateTime created;


  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.comptesActif, 
    required this.comptesPactif,
    required this.statut,
    required this.signature,
    required this.created
  });

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      comptesActif: row[2],
      comptesPactif: row[3],
      statut: row[4],
      signature: row[5],
      created: row[6]
    );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      comptesActif: json['comptesActif'],
      comptesPactif: json['comptesPactif'],
      statut: json['statut'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleBilan': titleBilan,
      'comptesActif': comptesActif,
      'comptesPactif': comptesPactif,
      'statut': statut,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}