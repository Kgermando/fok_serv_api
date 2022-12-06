class BanqueNameModel {
  late int? id;
  late String nomComplet;
  late String rccm;
  late String idNat; 
  late String addresse; 
  late DateTime created;

  BanqueNameModel(
      {this.id,
      required this.nomComplet,
      required this.rccm,
      required this.idNat,
      required this.addresse, 
      required this.created});

  factory BanqueNameModel.fromSQL(List<dynamic> row) {
    return BanqueNameModel(
      id: row[0],
      nomComplet: row[1],
      rccm: row[2],
      idNat: row[3],
      addresse: row[4],
      created: row[5]
    );
  }

  factory BanqueNameModel.fromJson(Map<String, dynamic> json) {
    return BanqueNameModel(
        id: json['id'],
        nomComplet: json['nomComplet'],
        rccm: json['rccm'],
        idNat: json['idNat'],
        addresse: json['addresse'], 
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomComplet': nomComplet,
      'rccm': rccm,
      'idNat': idNat,
      'addresse': addresse, 
      'created': created.toIso8601String()
    };
  }
}
