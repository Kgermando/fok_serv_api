import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class LogistiqueDepartementRepository {
  final PostgreSQLConnection executor;

  LogistiqueDepartementRepository(this.executor);

  static String tableNameLogistiqueEngin = 'anguins';
  static String tableNameLogistiqueImmobiliers = 'immobiliers';
  static String tableNameLogistiqueCarburants = 'carburants';
  static String tableNameLogistiqueEntretiens = 'entretiens';
  static String tableNameLogistiqueEtatMateriels = 'etat_materiels';
  static String tableNameLogistiqueMobiliers = 'mobiliers';
  static String tableNameLogistiqueTrajets = 'trajets';

  Future<NotifySumModel> getCountDD() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameLogistiqueCarburants where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueEngin where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueEntretiens where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueEtatMateriels where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueImmobiliers where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueMobiliers where "approbation_dd" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueTrajets where "approbation_dd" = '-')
          
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
