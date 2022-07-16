import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class MailsNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  MailsNotifyRepository(this.executor, this.tableName);

  Future<NotifyModel> getCount(String email) async {
    try {
      var data = <NotifyModel>{};
      var querySQL =
        """SELECT COUNT(*) FROM $tableName where  
        "email"='$email' AND "read" = 'false';""";
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
