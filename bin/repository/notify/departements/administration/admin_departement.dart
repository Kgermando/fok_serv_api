import 'dart:developer';

import 'package:postgres/postgres.dart';

import '../../../../models/notify/notify_sum_model.dart';

class AdminDepartementRepository {
  final PostgreSQLConnection executor;
  AdminDepartementRepository(this.executor);

  static String tableNameBudget = 'departement_budgets';
  static String tableNameCommMarketingCampaign = 'campaigns';
  static String tableNameComptabiliteSuccurasale = 'succursales';
  static String tableNameComptBalance = 'balance_comptes';
  static String tableNameComptBilans = 'bilans';
  static String tableNameComptComptesResultat = 'comptes_resultat';
  static String tableNameComptJournals = 'journals';
  static String tableNameExploitation = 'projets';
  static String tableNameFinanceCreance = 'creances';
  static String tableNameFinanceDette = 'dettes';
  static String tableNameLogistiqueEngin = 'anguins';
  static String tableNameLogistiqueImmobiliers = 'immobiliers';
  static String tableNameRh = 'transport_restaurations';
  static String tableNameDevis = 'devis';

  Future<NotifySumModel> getCountBudget() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameBudget where 
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
      throw Exception('$e');
    }
  }

  Future<NotifySumModel> getCountCommMarketing() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
        (
          (SELECT COUNT(*) FROM $tableNameCommMarketingCampaign where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "observation" = 'false') 
        +
          (SELECT COUNT(*) FROM $tableNameComptabiliteSuccurasale where 
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
      throw Exception('$e');
    }
  }

  Future<NotifySumModel> getCountComptabilite() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameComptBalance where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true') 
        +
          (SELECT COUNT(*) FROM $tableNameComptBilans where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND 
        "is_submit" = 'true')
        +
          (SELECT COUNT(*) FROM $tableNameComptComptesResultat where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-')
        +
          (SELECT COUNT(*) FROM $tableNameComptJournals where  
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
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

  Future<NotifySumModel> getCountExploitation() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameExploitation where 
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
      throw Exception('$e');
    }
  }

  Future<NotifySumModel> getCountFinance() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameFinanceCreance where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-' AND
        "statut_paie" = 'false') 
        +
          (SELECT COUNT(*) FROM $tableNameFinanceDette where 
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
      throw Exception('$e');
    }
  }

  Future<NotifySumModel> getCountLogistique() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
          (SELECT COUNT(*) FROM $tableNameLogistiqueEngin where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
        +
          (SELECT COUNT(*) FROM $tableNameLogistiqueImmobiliers where 
        "approbation_dd" = 'Approved' AND
        "approbation_dg" = '-') 
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

  Future<NotifySumModel> getCountRH() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameRh where 
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
      throw Exception('$e');
    }
  }

  Future<NotifySumModel> getCountDevis() async {
    try {
      var data = <NotifySumModel>{};
      var querySQL = """SELECT SUM  
      (
        (SELECT COUNT(*) FROM $tableNameDevis where 
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
      throw Exception('$e');
    }
  }
}
