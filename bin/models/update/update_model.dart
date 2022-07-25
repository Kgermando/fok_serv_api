class UpdateModel {
  late int? id;
  late String version;
  late String urlUpdate;
  late DateTime created;

  UpdateModel(
      {this.id,
      required this.version,
      required this.urlUpdate,
      required this.created});

  factory UpdateModel.fromSQL(List<dynamic> row) {
    return UpdateModel(
      id: row[0],
      version: row[1],
      urlUpdate: row[2],
      created: row[3]
    );
  }

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      id: json['id'],
      version: json['version'],
      urlUpdate: json['urlUpdate'], 
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'urlUpdate': urlUpdate, 
      'created': created.toIso8601String()
    };
  }
}
