class CartCountModel {
  final int count;

  const CartCountModel({required this.count});

  factory CartCountModel.fromSQL(List<dynamic> row) {
    return CartCountModel(count: row[0]);
  }

  factory CartCountModel.fromJson(Map<String, dynamic> json) {
    return CartCountModel(count: json['count']);
  }

  factory CartCountModel.fromJsonSqlite(Map<String, dynamic> json) {
    return CartCountModel(count: json['COUNT(*)']);
  }

  Map<String, dynamic> toJson() {
    return {'count': count};
  }
}
