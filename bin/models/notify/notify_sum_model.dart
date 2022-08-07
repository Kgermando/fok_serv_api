class NotifySumModel {
  final int sum;

  const NotifySumModel({required this.sum});

  factory NotifySumModel.fromSQL(List<dynamic> row) {
    return NotifySumModel(sum: row[0]);
  }

  factory NotifySumModel.fromJson(Map<String, dynamic> json) {
    return NotifySumModel(sum: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'count': sum};
  }
}

