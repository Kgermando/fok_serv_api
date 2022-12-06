import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_model.dart';
import '../../models/comptabilites/balance_sum_model.dart'; 

class BalanceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceRepository(this.executor, this.tableName);

  Future<List<BalanceModel>> getAllData() async {
    var data = <BalanceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<BalanceSumModel>> getAllSumData() async {
    var data = <BalanceSumModel>{};
    var querySQL =
      "SELECT \"comptes\", SUM(debit::FLOAT), SUM(credit::FLOAT) FROM $tableName GROUP BY \"comptes\";";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceSumModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<BalanceChartModel>> getAllChartData() async {
    var data = <BalanceChartModel>{};
    var querySQL =
        "SELECT \"comptes\", created , SUM(debit::FLOAT), SUM(credit::FLOAT) FROM $tableName GROUP BY \"comptes\", created ORDER BY created ASC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceChartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<BalancePieChartModel>> getBalanceChartPie() async {
    try {
      var data = <BalancePieChartModel>{};

      var querySQL =
          "SELECT comptes, COUNT(comptes) FROM $tableName GROUP BY \"comptes\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(BalancePieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw BalancePieChartModel;
    }
  }


  Future<void> insertData(BalanceModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, numero_operation, libele,"
        "comptes, debit, credit, signature, created)"
        "VALUES (nextval('balances_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
        substitutionValues: {
          '1': data.numeroOperation,
          '2': data.libele,
          '3': data.comptes,
          '4': data.debit,
          '5': data.credit,
          '6': data.signature,
          '7': data.created 
        });
    });
  }

  Future<void> update(BalanceModel data) async {
    await executor.query("""UPDATE $tableName
        SET numero_operation = @1, libele = @2, comptes = @3, debit = @4, 
        credit = @5, signature = @6, created = @7 WHERE id = @8""", 
      substitutionValues: {
      '1': data.numeroOperation,
      '2': data.libele,
      '3': data.comptes,
      '4': data.debit,
      '5': data.credit,
      '6': data.signature,
      '7': data.created,
      '8': data.id
    });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      }
    );
    } catch (e) {
      'erreur $e';
    }
  }

  Future<BalanceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM $tableName WHERE \"id\" = '$id'");
    return BalanceModel(
      id: data[0][0],
      numeroOperation: data[0][1],
      libele: data[0][2],
      comptes: data[0][3],
      debit: data[0][4],
      credit: data[0][5],
      signature: data[0][6],
      created: data[0][7] 
    );
  }
}
