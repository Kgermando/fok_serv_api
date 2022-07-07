class AgendaModel {
  late int? id;
  late String title;
  late String description;
  late DateTime dateRappel;
  late String signature;
  late DateTime created;

  AgendaModel(
      {this.id,
      required this.title,
      required this.description,
      required this.dateRappel,
      required this.signature,
      required this.created});

  factory AgendaModel.fromSQL(List<dynamic> row) {
    return AgendaModel(
        id: row[0],
        title: row[1],
        description: row[2],
        dateRappel: row[3],
        signature: row[4],
        created: row[5]);
  }

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dateRappel: DateTime.parse(json['dateRappel']),
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateRappel': dateRappel.toIso8601String(),
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}

 