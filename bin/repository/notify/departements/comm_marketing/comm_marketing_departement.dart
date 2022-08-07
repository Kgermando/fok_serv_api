import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class CommMarketingDepartementRepository {
  final PostgreSQLConnection executor;
  CommMarketingDepartementRepository(this.executor);

  static String tableNameCommMarketingCampaign = 'campaigns';
  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameCommMarketingCampaign where 
        "approbation_dd" = '-' AND 
        "observation" = 'false')
        +
        (SELECT COUNT(*) FROM "produits_model" where "approbation_dd" = '-')
        +
        (SELECT COUNT(*) FROM "succursales" where "approbation_dd" = '-')
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
