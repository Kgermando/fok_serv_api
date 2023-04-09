

class AgendaModel {
  late int? id;
  late String title;
  late String description;
  late DateTime dateRappel;
  late String signature;
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  AgendaModel(
      {this.id,
      required this.title,
      required this.description,
      required this.dateRappel,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory AgendaModel.fromSQL(List<dynamic> row) {
    return AgendaModel(
        id: row[0],
        title: row[1],
        description: row[2],
        dateRappel: row[3],
        signature: row[4],
        created: row[5],
        business: row[6],
        sync: row[7],
        async: row[8]);
  }

  factory AgendaModel.fromJson(Map<String, dynamic> json) {
    return AgendaModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dateRappel: DateTime.parse(json['dateRappel']),
        signature: json['signature'],
        created: DateTime.parse(json['created']),
      business: json['business'],
      sync: json['sync'],
      async: json['async'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateRappel': dateRappel.toIso8601String(),
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }


}
