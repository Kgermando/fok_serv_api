class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String pays;
  late String nameBusiness;
  late DateTime created;

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.pays,
    required this.nameBusiness,
    required this.created,
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      pays: row[3],
      nameBusiness: row[4],
      created: row[5]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      pays: json['pays'],
      nameBusiness: json["nameBusiness"],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'pays': pays,
      "nameBusiness": nameBusiness,
      'created': created.toIso8601String(),
    };
  }
}