import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';


class RhDepartementRepository {
  final PostgreSQLConnection executor;

  RhDepartementRepository(this.executor);

  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM "salaires" where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM "transport_restaurations" where 
            "approbation_dd" = '-' AND 
            "observation" = 'false' AND "is_submit" = 'true')
      );""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifySumModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifySumModel;
    }
  }
}
