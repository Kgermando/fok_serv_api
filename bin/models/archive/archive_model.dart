class ArchiveFolderModel {
  late int? id;
  late String departement;
  late String folderName;
  late String signature;
  late DateTime created;

  ArchiveFolderModel(
    { 
      this.id,
      required this.departement,
      required this.folderName,
      required this.signature,
      required this.created
    }
  );

  factory ArchiveFolderModel.fromSQL(List<dynamic> row) {
    return ArchiveFolderModel(
      id: row[0],
      departement: row[1],
      folderName: row[2],
      signature: row[3],
      created: row[4]
    );
  }

  factory ArchiveFolderModel.fromJson(Map<String, dynamic> json) {
    return ArchiveFolderModel(
      id: json['id'],
      departement: json['departement'],
      folderName: json['folderName'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departement': departement,
      'folderName': folderName,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}


class ArchiveModel { 
  late int? id;
  late String departement;
  late String folderName;
  late String nomDocument;
  late String description;
  late String fichier;
  late String signature;
  late DateTime created;

  ArchiveModel({
    this.id,
    required this.departement,
    required this.folderName,
    required this.nomDocument,
    required this.description,
    required this.fichier,
    required this.signature,
    required this.created
  });

  factory ArchiveModel.fromSQL(List<dynamic> row) {
    return ArchiveModel(
      id: row[0],
      departement: row[1],
      folderName: row[2],
      nomDocument: row[3],
      description: row[4],
      fichier: row[5],
      signature: row[6],
      created: row[7]
    );
  }

  factory ArchiveModel.fromJson(Map<String, dynamic> json) {
    return ArchiveModel(
      id: json['id'],
      departement: json['departement'],
      folderName: json['folderName'],
      nomDocument: json['nomDocument'],
      description: json['description'],
      fichier: json['fichier'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departement': departement,
      'folderName': folderName,
      'nomDocument': nomDocument,
      'description': description,
      'fichier': fichier,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
