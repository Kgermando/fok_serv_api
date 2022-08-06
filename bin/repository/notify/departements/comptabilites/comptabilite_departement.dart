import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_model.dart';

class ComptabiliteDepartementRepository {
  final PostgreSQLConnection executor;

  ComptabiliteDepartementRepository(this.executor);

  Future<NotifyModel> getCountDD() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT SUM  
      (
         (SELECT COUNT(*) FROM balance_comptes where
           "approbation_dd" = '-' AND
           "is_submit" = 'true')
        +
         (SELECT COUNT(*) FROM bilans where 
           "approbation_dd" = '-' AND
           "is_submit" = 'true')
        +
         (SELECT COUNT(*) FROM comptes_resultat where 
           "approbation_dd" = '-')
        +
         (SELECT COUNT(*) FROM journals where 
           "approbation_dd" = '-')
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