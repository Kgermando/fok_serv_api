import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';

class DepensesRepository {
  final PostgreSQLConnection executor;

  DepensesRepository(this.executor);

  Future<List<PieChartModel>> getDepartementChartPieMounth() async {
    try {
      var data = <PieChartModel>{};
      var querySQL = """SELECT departement, 
          SUM(montant ::FLOAT) FROM "banques" WHERE "created" >= NOW() - '1 mons' :: INTERVAL  
            GROUP BY "departement";
      """;
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  Future<List<PieChartModel>> getDepartementChartPieYear() async {
    try {
      var data = <PieChartModel>{};
      var querySQL = """SELECT departement, 
          SUM(montant ::FLOAT) FROM "banques" WHERE "created" >= NOW() - '1 years' :: INTERVAL  
            GROUP BY "departement";
      """; 
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  
}
