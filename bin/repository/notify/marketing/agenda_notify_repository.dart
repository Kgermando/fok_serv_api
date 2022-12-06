import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class AgendaNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgendaNotifyRepository(this.executor, this.tableName);

  Future<NotifyModel> getCount(String matricule) async {
    try {
      var data = <NotifyModel>{};
      var querySQL =
        """SELECT COUNT(*) FROM $tableName where "signature"='$matricule' AND
        EXTRACT(DAY FROM "date_rappel" ::TIMESTAMP) = EXTRACT(DAY FROM NOW() ::TIMESTAMP) AND
        EXTRACT(MONTH FROM "date_rappel" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "date_rappel" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) ;""";
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
