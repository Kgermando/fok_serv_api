import 'package:postgres/postgres.dart';

import '../../../models/notify/notify_model.dart';

class SalaireNotifyRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  SalaireNotifyRepository(this.executor, this.tableName);

  // Future<NotifyModel> getCountDG() async {
  //   try {
  //     var data = <NotifyModel>{};
  //     var querySQL = "SELECT COUNT(*) FROM $tableName where approbation_dd = 'Approved';";
  //     List<List<dynamic>> results = await executor.query(querySQL);
  //     for (var row in results) {
  //       data.add(NotifyModel.fromSQL(row));
  //     }
  //     return data.single;
  //   } catch (e) {
  //     throw NotifyModel;
  //   }
  // }

  Future<NotifyModel> getCountDD() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) == EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) == EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
        "approbation_dd" = '-' AND 
        "observation" = 'false';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }

  Future<NotifyModel> getCountBudget() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) == EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) == EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
        "approbation_dd" = 'Approved' AND 
        "approbation_budget" = '-' AND 
        "observation" = 'false';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  }

  Future<NotifyModel> getCountFin() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) == EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) == EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
        "approbation_dd" = 'Approved' AND 
        "approbation_budget" = 'Approved' AND 
        "approbation_fin" = '-' AND 
        "observation" = 'false';""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifyModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw NotifyModel;
    }
  } 

  Future<NotifyModel> getCountObs() async {
    try {
      var data = <NotifyModel>{};
      var querySQL = """SELECT COUNT(*) FROM $tableName where 
        EXTRACT(MONTH FROM "created_at" ::TIMESTAMP) == EXTRACT(MONTH FROM NOW() ::TIMESTAMP) AND
        EXTRACT(YEAR FROM "created_at" ::TIMESTAMP) == EXTRACT(YEAR FROM NOW() ::TIMESTAMP) AND
        "approbation_dd" = 'Approved' AND  
        "approbation_budget" = 'Approved' AND 
        "approbation_fin" = 'Approved' AND 
        "observation" = 'false';""";
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