class PresenceModel {
  late int? id;
  late String remarque;
  late bool finJournee;
  late String signature; // celui qui fait le document
  late DateTime createdRef;
  late DateTime created;

  PresenceModel(
      {this.id,
      required this.remarque,
      required this.finJournee,
      required this.signature,
      required this.createdRef,
      required this.created});

  factory PresenceModel.fromSQL(List<dynamic> row) {
    return PresenceModel(
      id: row[0],
      remarque: row[1],
      finJournee: row[2],
      signature: row[3],
      createdRef: row[4],
      created: row[5]
    );
  }

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
        id: json['id'],
        remarque: json['remarque'],
        finJournee: json['finJournee'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'remarque': remarque,
      'finJournee': finJournee,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}
