class CourbeChartModel {
  final String created;
  final double sum;

  CourbeChartModel({required this.created, required this.sum});

  factory CourbeChartModel.fromSQL(List<dynamic> row) {
    return CourbeChartModel(
      created: row[0],
      sum: row[1],
    );
  }

  factory CourbeChartModel.fromJson(Map<String, dynamic> json) {
    return CourbeChartModel(
      created: json['created'],
      sum: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'created': created, 'sum': sum};
  }
}
