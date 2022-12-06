import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class CommDepartementRepository {
  final PostgreSQLConnection executor;
  CommDepartementRepository(this.executor);

  static String tableNameCommMarketingProduitsModel = 'produits_model';
  static String tableNameCommMarketingSuccursales = 'succursales';
  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameCommMarketingProduitsModel where "approbation_dd" = '-')
        +
        (SELECT COUNT(*) FROM $tableNameCommMarketingSuccursales where "approbation_dd" = '-')
      );""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifySumModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
