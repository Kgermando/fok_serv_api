class BilanModel {
  late int? id;
  late String titleBilan;
  late String signature;
  late DateTime createdRef;
  late DateTime created;


  BilanModel({
    this.id, 
    required this.titleBilan, 
    required this.signature,
    required this.createdRef,
    required this.created
  });

  factory BilanModel.fromSQL(List<dynamic> row) {
    return BilanModel(
      id: row[0],
      titleBilan: row[1],
      signature: row[2],
      createdRef: row[3],
      created: row[4]
    );
  }

  factory BilanModel.fromJson(Map<String, dynamic> json) {
    return BilanModel(
      id: json['id'],
      titleBilan: json['titleBilan'],
      signature: json['signature'],
      createdRef: DateTime.parse(json['createdRef']),
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleBilan': titleBilan,
      'signature': signature,
      'createdRef': createdRef.toIso8601String(),
      'created': created.toIso8601String()
    };
  }
}