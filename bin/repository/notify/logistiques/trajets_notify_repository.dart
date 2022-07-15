import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class TrajetNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TrajetNotifyRepository(this.executor, this.tableName);

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
