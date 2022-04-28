class NumberFactureModel {
  late int? id;
  late String number;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;

  NumberFactureModel(
    {this.id,
    required this.number,
    required this.succursale,
    required this.signature,
    required this.created
  });

  factory NumberFactureModel.fromSQL(List<dynamic> row) {
    return NumberFactureModel(
        id: row[0],
        number: row[1],
        succursale: row[2],
        signature: row[3],
        created: row[4]
    );
  }

  factory NumberFactureModel.fromJson(Map<String, dynamic> json) {
    return NumberFactureModel(
        id: json['id'],
        number: json['number'],
        succursale: json['succursale'],
        signature: json['signature'],
        created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
