class MonnaieModel {
  late int? id;
  late String monnaie;
  late String monnaieEnlettre;
  late String signature; // celui qui fait le document
  late DateTime created;

  MonnaieModel(
      {this.id,
      required this.monnaie,
      required this.monnaieEnlettre,
      required this.signature,
      required this.created});

  factory MonnaieModel.fromSQL(List<dynamic> row) {
    return MonnaieModel(
        id: row[0],
        monnaie: row[1],
        monnaieEnlettre: row[2],
        signature: row[3],
        created: row[4]);
  }

  factory MonnaieModel.fromJson(Map<String, dynamic> json) {
    return MonnaieModel(
        id: json['id'],
        monnaie: json['monnaie'],
        monnaieEnlettre: json['monnaieEnlettre'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'monnaie': monnaie,
      'monnaieEnlettre': monnaieEnlettre,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
