class VenteChartModel {
  final String idProductCart;
  final int count;
  final double sum;
  

  VenteChartModel({required this.idProductCart, required this.count, required this.sum});

  factory VenteChartModel.fromSQL(List<dynamic> row) {
    return VenteChartModel(
      idProductCart: row[0],
      count: row[1],
      sum: row[2]
    );
  }

  factory VenteChartModel.fromJson(Map<String, dynamic> json) {
    return VenteChartModel(
        idProductCart: json['idProductCart'],
        count: json['count'],
        sum: json['sum'],
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'idProductCart': idProductCart,
      'count': count,
      'sum': sum
    };
  }
}
   