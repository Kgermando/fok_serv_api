class NotifyModel {
  final int count;

  const NotifyModel({required this.count});

  factory NotifyModel.fromSQL(List<dynamic> row) {
    return NotifyModel(count: row[0]);
  }

  factory NotifyModel.fromJson(Map<String, dynamic> json) {
    return NotifyModel(count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'count': count};
  }
}
