class AgentCountModel {
  final int count;

  const AgentCountModel({required this.count});

  factory AgentCountModel.fromSQL(List<dynamic> row) {
    return AgentCountModel(count: row[0]);
  }

  factory AgentCountModel.fromJson(Map<String, dynamic> json) {
    return AgentCountModel(count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'count': count};
  }
}
