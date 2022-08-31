class PresenceModel {
  late int? id;
  late String title;
  late String signature; // celui qui fait le document
  late DateTime created;

  PresenceModel(
      {this.id,
      required this.title,
      required this.signature,
      required this.created});

  factory PresenceModel.fromSQL(List<dynamic> row) {
    return PresenceModel(
        id: row[0], title: row[1], signature: row[2], created: row[3]);
  }

  factory PresenceModel.fromJson(Map<String, dynamic> json) {
    return PresenceModel(
        id: json['id'],
        title: json['title'],
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}
