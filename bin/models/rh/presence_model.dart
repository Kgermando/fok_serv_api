class PresenceModel {
  late int? id;
  late String remarque;
  late String finJournee;
  late String signature; // celui qui fait le document
  late String signatureFermeture; // celui qui cloture la journee
  late DateTime createdRef;
  late DateTime created;

  PresenceModel(
      {this.id,
      required this.remarque,
      required this.finJournee,
      required this.signature,
      required this.signatureFermeture,
      required this.createdRef,
      required this.created});

  factory PresenceModel.fromSQL(List<dynamic> row) {
    return PresenceModel(
        id: row[0],
        remarque: row[1],
        finJournee: row[2],
        signature: row[3],
        signatureFermeture: row[4],
        createdRef: row[5],
        created: row[6]);
  }

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
        id: json['id'],
        remarque: json['remarque'],
        finJournee: json['finJournee'],
        signature: json['signature'],
        signatureFermeture: json['signatureFermeture'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'remarque': remarque,
      'finJournee': finJournee,
      'signature': signature,
      'signatureFermeture': signatureFermeture,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}
