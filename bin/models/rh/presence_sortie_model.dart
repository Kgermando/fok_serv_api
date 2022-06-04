class PresenceSortieModel {
  late int? id;
  late String nom;
  late String postnom;
  late String prenom;
  late String remarque;
  late String signature; // celui qui fait le document
  late DateTime created;

  PresenceSortieModel(
      {this.id,
      required this.nom,
      required this.postnom,
      required this.prenom,
      required this.remarque,
      required this.signature,
      required this.created});

  factory PresenceSortieModel.fromSQL(List<dynamic> row) {
    return PresenceSortieModel(
        id: row[0],
        nom: row[1],
        postnom: row[2],
        prenom: row[3],
        remarque: row[4],
        signature: row[5],
        created: row[6]);
  }

  factory PresenceSortieModel.fromJson(Map<String, dynamic> json) {
    return PresenceSortieModel(
        id: json['id'],
        nom: json['nom'],
        postnom: json['postnom'],
        prenom: json['prenom'],
        remarque: json['remarque'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'remarque': remarque,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
