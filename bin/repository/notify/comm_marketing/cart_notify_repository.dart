import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class CartNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CartNotifyRepository(this.executor, this.tableName);

  Future<NotifyModel> getCount(String matricule) async {
    try {
      var data = <NotifyModel>{};
      var querySQL =
        """SELECT COUNT(*) FROM $tableName where  
        "signature"='$matricule';""";
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
