class DepensePieChartModel {
  final String libele;
  final int sum;

  DepensePieChartModel(
    {
      required this.libele,
      required this.sum
    });

  factory DepensePieChartModel.fromSQL(List<dynamic> row) {
    return DepensePieChartModel(
        libele: row[0],
        sum: row[1],
      );
  }
}

