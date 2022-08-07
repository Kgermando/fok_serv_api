import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class FinanceDepartementRepository {
  final PostgreSQLConnection executor;

  FinanceDepartementRepository(this.executor);

  Future<NotifySumModel> getCountFin() async {
     try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM creances where 
          "approbation_dd" = '-' AND
          "statut_paie" = 'false')
        +
          (SELECT COUNT(*) FROM dettes where 
          "approbation_dd" = '-' AND
          "statut_paie" = 'false')
        + 
          (SELECT COUNT(*) FROM transport_restaurations where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = '-' AND 
            "observation" = 'false' AND "is_submit" = 'true') 
        + 
          (SELECT COUNT(*) FROM salaires where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = '-' AND 
            "observation" = 'false') 
        + 
          (SELECT COUNT(*) FROM devis where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = '-' AND 
            "observation" = 'false')
        + 
          (SELECT COUNT(*) FROM campaigns where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = '-' AND 
            "observation" = 'false')
        + 
          (SELECT COUNT(*) FROM projets where 
          "approbation_dd" = 'Approved' AND 
          "approbation_dg" = 'Approved' AND 
          "approbation_budget" = 'Approved' AND 
          "approbation_fin" = '-' AND 
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


  Future<NotifySumModel> getCountFinObs() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM transport_restaurations where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = 'Approved' AND 
            "observation" = 'false' AND "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM projets where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = 'Approved' AND 
            "observation" = 'false')
        + 
          (SELECT COUNT(*) FROM salaires where 
            EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) = EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
            EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) = EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
            "approbation_dd" = 'Approved' AND  
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = 'Approved' AND 
            "observation" = 'false') 
        + 
          (SELECT COUNT(*) FROM devis where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = 'Approved' AND 
            "observation" = 'false') 
        + 
          (SELECT COUNT(*) FROM campaigns where 
            "approbation_dd" = 'Approved' AND 
            "approbation_dg" = 'Approved' AND 
            "approbation_budget" = 'Approved' AND 
            "approbation_fin" = 'Approved' AND 
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