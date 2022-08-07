import 'dart:developer';

import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class AdminDepartementRepository {
  final PostgreSQLConnection executor;
  AdminDepartementRepository(this.executor);

  Future<NotifySumModel> getCountBudget() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM "departement_budgets" where 
        NOW() <= "periode_fin" AND
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true')  
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

  Future<NotifySumModel> getCountCommMarketing() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
        (
          (SELECT COUNT(*) FROM "campaigns" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "observation" = 'false') 
        +
          (SELECT COUNT(*) FROM "succursales" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-')
        
      );""";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(NotifySumModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      log('$e');
      throw NotifySumModel;
    }
  }

  Future<NotifySumModel> getCountComptabilite() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM "balance_comptes" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true') 
        +
          (SELECT COUNT(*) FROM "bilans" where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM "comptes_resultat" where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-')
        +
          (SELECT COUNT(*) FROM "journals" where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
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

  Future<NotifySumModel> getCountExploitation() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM "projets" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
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

  Future<NotifySumModel> getCountFinance() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM "creances" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND
        "statut_paie" = 'false') 
        +
          (SELECT COUNT(*) FROM "dettes" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND
        "statut_paie" = 'false') 
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

  Future<NotifySumModel> getCountLogistique() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM "anguins" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
        +
          (SELECT COUNT(*) FROM "immobiliers" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
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

  Future<NotifySumModel> getCountRH() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM "transport_restaurations" where 
          "approbation_dd" = 'Approved' AND
          "approbation_dg" = '-' AND 
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

  Future<NotifySumModel> getCountDevis() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM "devis" where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
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
