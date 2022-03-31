import 'agent_model.dart';

class PaiementDiversModel {
  late int? id;
  late AgentModel agent;
  late bool observation; // Payé ou non Payé
  late String modePaiement; // mode depayement
  late String divers; // divers pour agent selon l'ordre
  late DateTime created;

  PaiementDiversModel(
      {this.id,
      required this.agent,
      required this.observation,
      required this.modePaiement,
      required this.divers,
      required this.created});

  factory PaiementDiversModel.fromSQL(List<dynamic> row) {
    return PaiementDiversModel(
        id: row[0],
        agent: row[1],
        observation: row[2],
        modePaiement: row[3],
        divers: row[4],
        created: row[5]);
  }

  factory PaiementDiversModel.fromJson(Map<String, dynamic> json) {
    return PaiementDiversModel(
        id: json['id'],
        agent: json['agent'],
        observation: json['observation'],
        modePaiement: json['modePaiement'],
        divers: json['divers'],
        created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'observation': observation,
      'modePaiement': modePaiement,
      'divers': divers,
      'created': created
    };
  }
}
