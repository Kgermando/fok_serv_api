class SuccursaleModel {
  final int? id;
  final String name;
  final String adresse;
  final String pays;
  final String nameBusiness;
  final DateTime date;

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.pays,
    required this.nameBusiness,
    required this.date,
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      pays: row[3],
      nameBusiness: row[4],
      date: row[5]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      pays: json['pays'],
      nameBusiness: json["nameBusiness"],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'pays': pays,
      "nameBusiness": nameBusiness,
      'date': date.toIso8601String(),
    };
  }
}