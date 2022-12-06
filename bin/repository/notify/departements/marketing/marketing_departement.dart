import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class MarketingDepartementRepository {
  final PostgreSQLConnection executor;
  MarketingDepartementRepository(this.executor);

  static String tableNameCommMarketingCampaign = 'campaigns';
  
  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameCommMarketingCampaign where 
        "approbation_dd" = '-' AND 
        "observation" = 'false')
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
