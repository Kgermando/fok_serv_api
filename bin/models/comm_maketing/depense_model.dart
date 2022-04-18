class DepenseModel {
  final int? id;
  final String motant;
  final String libele;
  final String motif;
  final DateTime created;
  final String telephone;
  final String succursale;
  final String nameBusiness;

  DepenseModel(
      {this.id,
      required this.motant,
      required this.libele,
      required this.motif,
      required this.created,
      required this.telephone,
      required this.succursale,
      required this.nameBusiness});

  factory DepenseModel.fromSQL(List<dynamic> row) {
    return DepenseModel(
        id: row[0],
        motant: row[1],
        libele: row[2],
        motif: row[3],
        created: row[4],
        telephone: row[5],
        succursale: row[6],
        nameBusiness: row[7]);
  }

  factory DepenseModel.fromJson(Map<String, dynamic> json) {
    return DepenseModel(
        id: json['id'],
        motant: json['motant'],
        libele: json['libele'],
        motif: json['motif'],
        created: DateTime.parse(json['created']),
        telephone: json["telephone"],
        succursale: json["succursale"],
        nameBusiness: json["nameBusiness"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'motant': motant,
      'libele': libele,
      'motif': motif,
      'created': created.toIso8601String(),
      "telephone": telephone,
      "succursale": succursale,
      "nameBusiness": nameBusiness
    };
  }
}
