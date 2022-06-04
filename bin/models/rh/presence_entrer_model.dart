class PresenceEntrerModel {
  late int? id;
  late DateTime reference;
  late String nom;
  late String postnom;
  late String prenom;
  late String remarque;
  late String signature; // celui qui fait le document
  late DateTime created;

  PresenceEntrerModel(
      {this.id,
      required this.reference,
      required this.nom,
      required this.postnom,
      required this.prenom,
      required this.remarque,
      required this.signature,
      required this.created});

  factory PresenceEntrerModel.fromSQL(List<dynamic> row) {
    return PresenceEntrerModel(
      id: row[0],
      reference: row[1],
      nom: row[2],
      postnom: row[3],
      prenom: row[4],
      remarque: row[5],
      signature: row[6],
      created: row[7]
    );
  }

  factory PresenceEntrerModel.fromJson(Map<String, dynamic> json) {
    return PresenceEntrerModel(
        id: json['id'],
        reference: json['reference'],
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
      'reference': reference,
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'remarque': remarque,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
