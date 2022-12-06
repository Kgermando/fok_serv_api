class FinExterieurNameModel {
  late int? id;
  late String nomComplet;
  late String rccm;
  late String idNat; 
  late String addresse; 
  late DateTime created;

  FinExterieurNameModel(
      {this.id,
      required this.nomComplet,
      required this.rccm,
      required this.idNat,
      required this.addresse, 
      required this.created});

  factory FinExterieurNameModel.fromSQL(List<dynamic> row) {
    return FinExterieurNameModel(
      id: row[0],
      nomComplet: row[1],
      rccm: row[2],
      idNat: row[3],
      addresse: row[4],
      created: row[5]
    );
  }

  factory FinExterieurNameModel.fromJson(Map<String, dynamic> json) {
    return FinExterieurNameModel(
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
