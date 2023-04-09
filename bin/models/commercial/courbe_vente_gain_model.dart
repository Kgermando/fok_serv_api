class CourbeVenteModel {
  final String created;
  final double sum;

  CourbeVenteModel({required this.created, required this.sum});

  factory CourbeVenteModel.fromSQL(List<dynamic> row) {
    return CourbeVenteModel(
      created: row[0],
      sum: row[1],
    );
  }

  factory CourbeVenteModel.fromJson(Map<String, dynamic> json) {
    return CourbeVenteModel(
      created: json['created'],
      sum: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'created': created, 'sum': sum};
  }
}



class CourbeGainModel {
  final String created;
  final double sum;

  CourbeGainModel({required this.created, required this.sum});

  factory CourbeGainModel.fromSQL(List<dynamic> row) {
    return CourbeGainModel(
      created: row[0],
      sum: row[1],
    );
  }

  factory CourbeGainModel.fromJson(Map<String, dynamic> json) {
    return CourbeGainModel(
      created: json['created'],
      sum: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'created': created, 'sum': sum};
  }
}
