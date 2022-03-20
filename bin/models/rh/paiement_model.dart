class PaiementModel {
  late int? id;
  late String matricule;
  late bool observation; // Payé ou non Payé
  late String modePaiement;
  late String prime;
  late DateTime created;

  PaiementModel(
      {this.id,
      required this.matricule,
      required this.observation,
      required this.modePaiement,
      required this.prime,
      required this.created});

  factory PaiementModel.fromSQL(List<dynamic> row) {
    return PaiementModel(
        id: row[0],
        matricule: row[1],
        observation: row[2],
        modePaiement: row[3],
        prime: row[4],
        created: row[5]);
  }

  factory PaiementModel.fromJson(Map<String, dynamic> json) {
    return PaiementModel(
        id: json['id'],
        matricule: json['matricule'],
        observation: json['observation'],
        modePaiement: json['modePaiement'],
        prime: json['prime'],
        created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matricule': matricule,
      'observation': observation,
      'modePaiement': modePaiement,
      'prime': prime,
      'created': created
    };
  }
}
