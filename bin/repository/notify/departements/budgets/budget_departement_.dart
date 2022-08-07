import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class BudgetDepartementRepository {
  final PostgreSQLConnection executor;
  BudgetDepartementRepository(this.executor);

  Future<NotifySumModel> getCountBudget() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT * FROM "departement_budgets" where
            NOW() <= "periode_fin"  AND
            "approbation_dd" = '-' AND
            "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM "transport_restaurations" where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false' AND "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM "salaires" where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM "projets" where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM "devis" where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = '-' AND 
            "observation" = 'false')
        +
          (SELECT COUNT(*) FROM "campaigns" where 
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
      throw NotifySumModel;
    }
  }
  
}

