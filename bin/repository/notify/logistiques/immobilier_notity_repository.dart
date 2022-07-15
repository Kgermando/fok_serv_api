import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class ImmobilierNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ImmobilierNotifyRepository(this.executor, this.tableName);
  
  Future<NotifyModel> getCountDG() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-';""";
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
          """SELECT COUNT(*) FROM $tableName where "approbation_dd" = '-';""";
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
