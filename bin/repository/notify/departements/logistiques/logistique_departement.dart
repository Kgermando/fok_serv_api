import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class LogistiqueDepartementRepository {
  final PostgreSQLConnection executor;

  LogistiqueDepartementRepository(this.executor);

  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM carburants where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM anguins where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM entretiens where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM etat_materiels where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM immobiliers where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM mobiliers where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM trajets where "approbation_dd" = '-')
          
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
