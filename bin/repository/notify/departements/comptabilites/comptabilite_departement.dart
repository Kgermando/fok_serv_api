import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class ComptabiliteDepartementRepository {
  final PostgreSQLConnection executor;

  ComptabiliteDepartementRepository(this.executor);
 
  static String tableNameComptBilans = 'bilans';
  static String tableNameComptComptesResultat = 'comptes_resultat'; 

  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameComptBilans where 
           "approbation_dd" = '-' AND
           "is_submit" = 'true')
        +
         (SELECT COUNT(*) FROM $tableNameComptComptesResultat where 
           "approbation_dd" = '-') 
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
