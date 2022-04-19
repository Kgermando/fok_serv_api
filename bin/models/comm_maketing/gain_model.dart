class GainModel {
  late int? id;
  late double sum;
  late DateTime created;
  late String telephone;
  late String succursale;
  late String nameBusiness;

  GainModel({
    this.id,
    required this.sum, 
    required this.created,
    required this.telephone,
    required this.succursale,
    required this.nameBusiness
  });
 
  factory GainModel.fromSQL(List<dynamic> row) {
    return GainModel(
      id: row[0],
      sum: row[1],
      created: row[2],
      telephone: row[3],
      succursale: row[4],
      nameBusiness: row[5]
    );
  }

  factory GainModel.fromJson(Map<String, dynamic> json) {
    return GainModel(
      id: json['id'],
      sum: double.parse(json['sum'].toString()),
      created: DateTime.parse(json['created']),
      telephone: json["telephone"],
      succursale: json["succursale"],
      nameBusiness: json["nameBusiness"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sum': sum,
      'created': created.toIso8601String(),
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness,
    };
  }
  
}
