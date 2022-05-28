class DepartementBudgetModel {
  late int? id;
  late String title;
  late String departement;
  late DateTime periodeDebut; // Durée
  late DateTime periodeFin; // Durée de fin

  late String signature; // celui qui fait le document
  late DateTime created;

  DepartementBudgetModel(
      {this.id,
      required this.title,
      required this.departement,
      required this.periodeDebut,
      required this.periodeFin,
      required this.signature,
      required this.created});

  factory DepartementBudgetModel.fromSQL(List<dynamic> row) {
    return DepartementBudgetModel(
        id: row[0],
        title: row[1],
        departement: row[2],
        periodeDebut: row[3],
        periodeFin: row[4],
        signature: row[5],
        created: row[6]
    );
  }

  factory DepartementBudgetModel.fromJson(Map<String, dynamic> json) {
    return DepartementBudgetModel(
        id: json['id'],
        title: json['title'],
        departement: json['departement'],
        periodeDebut: DateTime.parse(json['periodeDebut']),
        periodeFin: DateTime.parse(json['periodeFin']),
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'departement': departement,
      'periodeDebut': periodeDebut.toIso8601String(),
      'periodeFin': periodeFin.toIso8601String(),
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
