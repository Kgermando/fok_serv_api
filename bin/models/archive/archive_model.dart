class ArchiveModel { 
  late int? id;
  late String nomDocument;
  late String departement;
  late String description;
  late String fichier;
  late String signature;
  late DateTime created;

  ArchiveModel({
    this.id,
    required this.nomDocument,
    required this.departement,
    required this.description,
    required this.fichier,
    required this.signature,
    required this.created
  });

  factory ArchiveModel.fromSQL(List<dynamic> row) {
    return ArchiveModel(
      id: row[0],
      nomDocument: row[1],
      departement: row[2],
      description: row[3],
      fichier: row[4],
      signature: row[5],
      created: row[6]
    );
  }

  factory ArchiveModel.fromJson(Map<String, dynamic> json) {
    return ArchiveModel(
      id: json['id'],
      nomDocument: json['nomDocument'],
      departement: json['departement'],
      description: json['description'],
      fichier: json['fichier'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomDocument': nomDocument,
      'departement': departement,
      'description': description,
      'fichier': fichier,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
