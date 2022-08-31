class UpdateModel {
  late int? id;
  late String version;
  late String urlUpdate;
  late DateTime created;
  late String isActive;

  UpdateModel(
      {this.id,
      required this.version,
      required this.urlUpdate,
      required this.created,
      required this.isActive});

  factory UpdateModel.fromSQL(List<dynamic> row) {
    return UpdateModel(
        id: row[0],
        version: row[1],
        urlUpdate: row[2],
        created: row[3],
        isActive: row[4]);
  }

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      id: json['id'],
      version: json['version'],
      urlUpdate: json['urlUpdate'],
      created: DateTime.parse(json['created']),
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'urlUpdate': urlUpdate,
      'created': created.toIso8601String(),
      'isActive': isActive,
    };
  }
}
