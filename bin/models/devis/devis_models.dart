class DevisModel {
  late int? id;
  late String title;
  late String priority;
  late String departement;
  late List list; // Choses a énumerer
  late String ligneBudgtaire;
  late String resources;
  late bool observation;

  late String signature; // celui qui fait le document
  late DateTime created;

  DevisModel(
      {this.id,
      required this.title,
      required this.priority,
      required this.departement,
      required this.list,
      required this.ligneBudgtaire,
      required this.resources,
      required this.observation,
      required this.signature,
      required this.created});

  factory DevisModel.fromSQL(List<dynamic> row) {
    return DevisModel(
      id: row[0],
      title: row[1],
      priority: row[2],
      departement: row[3],
      list: row[4],
      ligneBudgtaire: row[5],
      resources: row[6],
      observation: row[7],
      signature: row[8],
      created: row[9]
    );
  }

  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        title: json['title'],
        priority: json['priority'],
        departement: json['departement'],
        list: json['list'],
        ligneBudgtaire: json['ligneBudgtaire'],
        resources: json['resources'],
        observation: json['observation'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'departement': departement,
      'list': list,
      'ligneBudgtaire': ligneBudgtaire,
      'resources': resources,
      'observation': observation,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
