class DevisModel {
  late int? id;
  late String title;
  late String priority;
  late String departement;
  late bool observation;
  late String signature; // celui qui fait le document
  late DateTime createdRef; // Date de reference
  late DateTime created;
  late bool isSubmit; // soumettre chez le chef

  DevisModel(
      {this.id,
      required this.title,
      required this.priority,
      required this.departement,
      required this.observation,
      required this.signature,
      required this.createdRef,
      required this.created, required this.isSubmit});

  factory DevisModel.fromSQL(List<dynamic> row) {
    return DevisModel(
        id: row[0],
        title: row[1],
        priority: row[2],
        departement: row[3],
        observation: row[4],
        signature: row[5],
        createdRef: row[6],
        created: row[7],
        isSubmit: row[8]
    );
  }

  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        title: json['title'],
        priority: json['priority'],
        departement: json['departement'],
        observation: json['observation'],
        signature: json['signature'],
        createdRef: DateTime.parse(json['createdRef']),
        created: DateTime.parse(json['created']),
      isSubmit: json['isSubmit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'departement': departement,
      'observation': observation,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String(),
      'isSubmit': isSubmit
    };
  }
}
