class NumberFactureModel {
  late int? id;
  late String number;
  late String succursale;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;

  NumberFactureModel(
      {this.id,
      required this.number,
      required this.succursale,
      required this.signature,
      required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory NumberFactureModel.fromSQL(List<dynamic> row) {
    return NumberFactureModel(
        id: row[0],
        number: row[1],
        succursale: row[2],
        signature: row[3],
        created: row[4],
        business: row[5],
        sync: row[6],
        async: row[7]);
  }

  factory NumberFactureModel.fromJson(Map<String, dynamic> json) {
    return NumberFactureModel(
        id: json['id'],
        number: json['number'],
        succursale: json['succursale'],
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
      'number': number,
      'succursale': succursale,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }

}
