class PresencePersonnelModel {
  late int? id;
  late int reference; // id presence
  late String identifiant; // matricule ou identité
  late String motif; // remarque ou objet de la visite ou de la retard
  late String sortie; // boolean
  late String signature; // celui qui fait le document
  late String signatureFermeture; // celui qui cloture la journee
  late DateTime created;
  late DateTime createdSortie;

  PresencePersonnelModel(
      {this.id,
      required this.reference,
      required this.identifiant,
      required this.motif,
      required this.sortie,
      required this.signature,
      required this.signatureFermeture,
      required this.created,
      required this.createdSortie});

  factory PresencePersonnelModel.fromSQL(List<dynamic> row) {
    return PresencePersonnelModel(
        id: row[0],
        reference: row[1],
        identifiant: row[2],
        motif: row[3],
        sortie: row[4],
        signature: row[5],
        signatureFermeture: row[6],
        created: row[7],
        createdSortie: row[8]);
  }

  factory PresencePersonnelModel.fromJson(Map<String, dynamic> json) {
    return PresencePersonnelModel(
        id: json['id'],
        reference: json['reference'],
        identifiant: json['identifiant'],
        motif: json['motif'],
        sortie: json['sortie'],
        signature: json['signature'],
        signatureFermeture: json['signatureFermeture'],
        created: DateTime.parse(json['created']),
        createdSortie: DateTime.parse(json['createdSortie']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'identifiant': identifiant,
      'motif': motif,
      'sortie': sortie,
      'signature': signature,
      'signatureFermeture': signatureFermeture,
      'created': created.toIso8601String(),
      'createdSortie': createdSortie.toIso8601String()
    };
  }
}
