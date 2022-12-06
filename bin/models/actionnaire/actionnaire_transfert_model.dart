class ActionnaireTransfertModel {
  late int? id;
  late String matriculeEnvoi;
  late String matriculeRecu; 
  late String montant; 
  late String signature;
  late DateTime created;

  ActionnaireTransfertModel(
      {this.id,
      required this.matriculeEnvoi,
      required this.matriculeRecu, 
      required this.montant, 
      required this.signature,
      required this.created});

  factory ActionnaireTransfertModel.fromSQL(List<dynamic> row) {
    return ActionnaireTransfertModel(
        id: row[0],
        matriculeEnvoi: row[1],
        matriculeRecu: row[2],
        montant: row[3],
        signature: row[4],
        created: row[5]
    );
  }

  factory ActionnaireTransfertModel.fromJson(Map<String, dynamic> json) {
    return ActionnaireTransfertModel(
        id: json['id'],
        matriculeEnvoi: json['matriculeEnvoi'],
        matriculeRecu: json["matriculeRecu"],  
        montant: json['montant'], 
        signature: json['signature'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matriculeEnvoi': matriculeEnvoi,
      'matriculeRecu': matriculeRecu, 
      'montant': montant, 
      'signature': signature,
      'created': created.toIso8601String()
    };
  }
}