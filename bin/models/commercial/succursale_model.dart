class SuccursaleModel {
  late int? id;
  late String name;
  late String adresse;
  late String province;
  late String signature; // celui qui fait le document
  late DateTime created;
  late String business;
  late String sync; // new, update, sync
  late String async;


  SuccursaleModel({
    this.id, 
    required this.name, 
    required this.adresse, 
    required this.province,
    required this.signature,
    required this.created,
      required this.business,
    required this.sync,
    required this.async,
  });

  factory SuccursaleModel.fromSQL(List<dynamic> row) {
    return SuccursaleModel(
      id: row[0],
      name: row[1],
      adresse: row[2],
      province: row[3],
      signature: row[4],
      created: row[5],
      business: row[6],
      sync: row[7],
      async: row[8]
    );
  }

  factory SuccursaleModel.fromJson(Map<String, dynamic> json) {
    return SuccursaleModel(
      id: json['id'],
      name: json['name'],
      adresse: json['adresse'],
      province: json['province'],
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
      'name': name,
      'adresse': adresse,
      'province': province,
      'signature': signature,
      'created': created.toIso8601String(),
      'business': business,
      'sync': sync,
      'async': async,
    };
  }
}