import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class BudgetNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BudgetNotifyRepository(this.executor, this.tableName);

  Future<NotifyModel> getCountDG() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        NOW() <= "periode_fin" AND
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }

  Future<NotifyModel> getCountDD() async {
    try {
      var data = <NotifyModel>{};
      var querySQL =
          """SELECT COUNT(*) FROM $tableName where
          NOW() <= "periode_fin"  AND
           "approbation_dd" = '-' AND
           "is_submit" = 'true';""";
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
