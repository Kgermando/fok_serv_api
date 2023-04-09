class VenteChartModel {
  final String idProductCart;
  final int count;

  VenteChartModel({required this.idProductCart, required this.count});

  factory VenteChartModel.fromSQL(List<dynamic> row) {
    return VenteChartModel(idProductCart: row[0], count: row[1]);
  }

  factory VenteChartModel.fromJson(Map<String, dynamic> json) {
    return VenteChartModel(
        idProductCart: json['idProductCart'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'idProductCart': idProductCart, 'count': count};
  }
}
