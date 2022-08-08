import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class BudgetDepartementRepository {
  final PostgreSQLConnection executor;
  BudgetDepartementRepository(this.executor);

  static String tableNameBudget = 'departement_budgets';
  static String tableNameCommMarketingCampaign = 'campaigns';
  static String tableNameRhTransRest = 'transport_restaurations';
  static String tableNameRhSalaire = 'salaires';
  static String tableNameDevis = 'devis';
  static String tableNameExploitation = 'projets';

  Future<NotifySumModel> getCountBudget() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameBudget where
            NOW() <= "periode_fin"  AND
            "approbation_dd" = '-' AND
            "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM $tableNameRhTransRest where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false' AND "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM $tableNameRhSalaire where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM $tableNameExploitation where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM $tableNameDevis where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM $tableNameCommMarketingCampaign where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false') 
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
