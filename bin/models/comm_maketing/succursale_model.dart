class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String province;
  late String signature; // celui qui fait le document
  late DateTime created;

  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.province,
    required this.signature,
    required this.created
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      province: row[3],
      signature: row[4],
      created: row[5]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      province: json['province'],
      signature: json['signature'],
      created: DateTime.parse(json['created'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adresse': adresse,
      'province': province,
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}