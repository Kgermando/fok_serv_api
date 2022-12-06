class AgentRoleModel {
  late int? id;
  late int reference;
  late String departement;
  late String agent;
  late String role;
  late DateTime created;

  AgentRoleModel(
      {this.id,
      required this.reference,
      required this.departement,
      required this.agent,
      required this.role,
      required this.created});

  factory AgentRoleModel.fromSQL(List<dynamic> row) {
    return AgentRoleModel(
        id: row[0],
        reference: row[1],
        departement: row[2],
        agent: row[3],
        role: row[4],
        created: row[5]);
  }

  factory AgentRoleModel.fromJson(Map<String, dynamic> json) {
    return AgentRoleModel(
        id: json['id'],
        reference: json['reference'],
        departement: json['departement'],
        agent: json['agent'],
        role: json['role'],
        created: DateTime.parse(json['created']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'departement': departement,
      'agent': agent,
      'role': role,
      'created': created.toIso8601String()
    };
  }
}
