import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class RhDepartementRepository {
  final PostgreSQLConnection executor;

  RhDepartementRepository(this.executor);

  static String tableNameRhTransRest = 'transport_restaurations';
  static String tableNameRhSalaire = 'salaires';

  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameRhSalaire where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM $tableNameRhTransRest where 
            "approbation_dd" = '-' AND 
            "observation" = 'false' AND "is_submit" = 'true')
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
