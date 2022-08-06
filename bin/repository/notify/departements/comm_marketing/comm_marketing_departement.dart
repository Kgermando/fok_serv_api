import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_model.dart';

class CommMarketingDepartementRepository {
  final PostgreSQLConnection executor;
  CommMarketingDepartementRepository(this.executor);

  Future<NotifyModel> getCountDD() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM campaigns where 
        "approbation_dd" = '-' AND 
        "observation" = 'false')
        +
        (SELECT COUNT(*) FROM produits_model where "approbation_dd" = '-')
        +
        (SELECT COUNT(*) FROM succursales where "approbation_dd" = '-')
      );""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }
}