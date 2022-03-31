
import 'agent_model.dart';

class PaiementSalaireModel {
  late int? id;
  late AgentModel agent;
  late bool observation; // Payé ou non Payé
  late String modePaiement; // mode depayement
  late DateTime created;

  PaiementSalaireModel(
      {this.id,
      required this.agent,
      required this.observation,
      required this.modePaiement,
      required this.created});

  factory PaiementSalaireModel.fromSQL(List<dynamic> row) {
    return PaiementSalaireModel(
        id: row[0],
        agent: row[1],
        observation: row[2],
        modePaiement: row[3],
        created: row[4]);
  }

  factory PaiementSalaireModel.fromJson(Map<String, dynamic> json) {
    return PaiementSalaireModel(
        id: json['id'],
        agent: json['agent'],
        observation: json['observation'],
        modePaiement: json['modePaiement'],
        created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'observation': observation,
      'modePaiement': modePaiement,
      'created': created
    };
  }
}
