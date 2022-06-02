class TransportRestauration {
  late int? id;
  late String title;
  late List agents;
  late String ligneBudgtaire;
  late String resources; 
  late String signature; // celui qui fait le document
  late DateTime created;

  TransportRestauration(
      {this.id,
      required this.title,
      required this.agents,
      required this.ligneBudgtaire,
      required this.resources,
      required this.signature,
      required this.created});

  factory TransportRestauration.fromSQL(List<dynamic> row) {
    return TransportRestauration(
        id: row[0],
        title: row[1],
        agents: row[2],
        ligneBudgtaire: row[3],
        resources: row[4],
        signature: row[5],
        created: row[6]);
  }

  factory TransportRestauration.fromJson(Map<String, dynamic> json) {
    return TransportRestauration(
        id: json['id'],
        title: json['title'],
        agents: json['agents'],
        ligneBudgtaire: json['ligneBudgtaire'],
        resources: json['resources'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'agents': agents,
      'ligneBudgtaire': ligneBudgtaire,
      'resources': resources,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}

class AgentTransRest {
  late int id;
  late String matricule;
  late String montant;
}
