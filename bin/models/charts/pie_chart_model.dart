class PieChartModel {
  final String departement;
  final int sum;

  PieChartModel({required this.departement, required this.sum});

  factory PieChartModel.fromSQL(List<dynamic> row) {
    return PieChartModel(
      departement: row[0],
      sum: row[1],
    );
  }

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return PieChartModel(departement: json['departement'], sum: json['sum']);
  }

  Map<String, dynamic> toJson() {
    return {'departement': departement, 'sum': sum};
  }
}

class PieChartMaterielModel {
  final String statut;
  final int count;

  PieChartMaterielModel({required this.statut, required this.count});

  factory PieChartMaterielModel.fromSQL(List<dynamic> row) {
    return PieChartMaterielModel(
      statut: row[0],
      count: row[1],
    );
  }

  factory PieChartMaterielModel.fromJson(Map<String, dynamic> json) {
    return PieChartMaterielModel(
        statut: json['statut'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'statut': statut, 'count': count};
  }
}

class PieChartEnguinModel {
  final String genre;
  final int count;

  PieChartEnguinModel({required this.genre, required this.count});

  factory PieChartEnguinModel.fromSQL(List<dynamic> row) {
    return PieChartEnguinModel(
      genre: row[0],
      count: row[1],
    );
  }

  factory PieChartEnguinModel.fromJson(Map<String, dynamic> json) {
    return PieChartEnguinModel(genre: json['genre'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'genre': genre, 'count': count};
  }
}

