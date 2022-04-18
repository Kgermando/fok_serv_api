class NumberFactureModel {
  late int? id;
  late String number;
  late String succursale;
  late String nameBusiness;

  NumberFactureModel(
    {this.id,
    required this.number,
    required this.succursale,
    required this.nameBusiness
  });

  factory NumberFactureModel.fromSQL(List<dynamic> row) {
    return NumberFactureModel(
        id: row[0],
        number: row[1],
        succursale: row[2],
        nameBusiness: row[3]
    );
  }

  factory NumberFactureModel.fromJson(Map<String, dynamic> json) {
    return NumberFactureModel(
        id: json['id'],
        number: json['number'],
        succursale: json["succursale"],
        nameBusiness: json["nameBusiness"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      "succursale": succursale,
      "nameBusiness": nameBusiness
    };
  }
}
