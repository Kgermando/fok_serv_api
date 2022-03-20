class SalaireModel {
  late int? id;
  late String matricule;
  late String salaire;
  late DateTime date;

  SalaireModel({this.id, 
    required this.matricule, required this.salaire,
      required this.date});

  factory SalaireModel.fromSQL(List<dynamic> row) {
    return SalaireModel(
      id: row[0],
      matricule: row[1],
      salaire: row[2],
      date: row[3]
    );
  }

  factory SalaireModel.fromJson(Map<String, dynamic> json) {
    return SalaireModel(
        id: json['id'],
        matricule: json['matricule'],
        salaire: json['salaire'],
        date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matricule': matricule,
      'salaire': salaire,
      'date': date.toIso8601String()
    };
  }
}

