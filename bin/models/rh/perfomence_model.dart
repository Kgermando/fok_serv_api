import 'agent_model.dart';

class PerformenceModel {
  late int? id;
  late AgentModel agent;
  late String hospitalite;
  late String ponctualite;
  late String travaille;
  late DateTime created;

  PerformenceModel(
      {this.id,
      required this.agent,
      required this.hospitalite,
      required this.ponctualite,
      required this.travaille,
      required this.created});

  factory PerformenceModel.fromSQL(List<dynamic> row) {
    return PerformenceModel(
        id: row[0],
        agent: row[1],
        hospitalite: row[2],
        ponctualite: row[3],
        travaille: row[4],
        created: row[5]);
  }

  factory PerformenceModel.fromJson(Map<String, dynamic> json) {
    return PerformenceModel(
      id: json['id'],
      agent: json['agent'],
      hospitalite: json['hospitalite'],
      ponctualite: json['ponctualite'],
      travaille: json['travaille'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent': agent,
      'hospitalite': hospitalite,
      'ponctualite': ponctualite,
      'travaille': travaille,
      'created': created.toIso8601String()
    };
  }
}
