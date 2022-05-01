class PresenceModel {
  late int? id;
  late DateTime arrive;
  late List arriveAgent;
  late DateTime sortie;
  late List sortieAgent;
  late String remarque;
  late bool finJournee;
  late String signature; // celui qui fait le document
  late DateTime created;

  PresenceModel(
      {this.id,
      required this.arrive,
      required this.arriveAgent,
      required this.sortie,
      required this.sortieAgent,
      required this.remarque,
      required this.finJournee,
      required this.signature,
      required this.created});

  factory PresenceModel.fromSQL(List<dynamic> row) {
    return PresenceModel(
        id: row[0],
        arrive: row[1],
        arriveAgent: row[2],
        sortie: row[3],
        sortieAgent: row[4],
        remarque: row[5],
        finJournee: row[6],
        signature: row[7],
        created: row[8]);
  }

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
        id: json['id'],
        arrive: DateTime.parse(json['arrive']),
        arriveAgent: json['arriveAgent'],
        sortie: DateTime.parse(json['sortie']),
        sortieAgent: json['sortieAgent'],
        remarque: json['remarque'],
        finJournee: json['finJournee'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arrive': arrive.toIso8601String(),
      'arriveAgent': arriveAgent,
      'sortie': sortie.toIso8601String(),
      'sortieAgent': sortieAgent,
      'remarque': remarque,
      'finJournee': finJournee,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
