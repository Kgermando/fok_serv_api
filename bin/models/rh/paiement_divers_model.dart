import 'agent_model.dart';

class PaiementDiversModel {
  late int? id;
  late AgentModel agent;
  late bool observation; // Payé ou non Payé  // pour Finance
  late String modePaiement; // mode depayement
  late String titleDivers; // divers pour agent selon l'ordre
  late String divers; // Prime, restauration, frais de mission, ....
  late DateTime created;
  late bool approbation; // pour DG

  PaiementDiversModel(
      {this.id,
      required this.agent,
      required this.observation,
      required this.modePaiement,
      required this.titleDivers,
      required this.divers,
      required this.created,
      required this.approbation});

  factory PaiementDiversModel.fromSQL(List<dynamic> row) {
    return PaiementDiversModel(
        id: row[0],
        agent: row[1],
        observation: row[2],
        modePaiement: row[3],
        titleDivers: row[4],
        divers: row[5],
        created: row[6],
        approbation: row[7]);
  }

  factory PaiementDiversModel.fromJson(Map<String, dynamic> json) {
    return PaiementDiversModel(
      id: json['id'],
      agent: json['agent'],
      observation: json['observation'],
      modePaiement: json['modePaiement'],
      titleDivers: json['titleDivers'],
      divers: json['divers'],
      created: DateTime.parse(json['created']),
      approbation: json['approbation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'observation': observation,
      'modePaiement': modePaiement,
      'titleDivers': titleDivers,
      'divers': divers,
      'created': created,
      'approbation': approbation
    };
  }
}
