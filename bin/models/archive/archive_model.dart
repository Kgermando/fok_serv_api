class ArchiveModel {
  late int? id;
  late String nomDocument;
  late String departement;
  late String signature;
  late DateTime created;

  ArchiveModel({
    this.id,
    required this.nomDocument,
    required this.departement,
    required this.signature,
    required this.created
  });

  factory ArchiveModel.fromSQL(List<dynamic> row) {
    return ArchiveModel(
      id: row[0],
      nomDocument: row[1],
      departement: row[2],
      signature: row[3],
      created: row[4]
    );
  }

  factory ArchiveModel.fromJson(Map<String, dynamic> json) {
    return ArchiveModel(
      id: json['id'],
      nomDocument: json['nomDocument'],
      departement: json['departement'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomDocument': nomDocument,
      'departement': departement,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
