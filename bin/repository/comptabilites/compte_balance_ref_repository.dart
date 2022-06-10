import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_comptes_model.dart';

class CompteBalanceRefRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CompteBalanceRefRepository(this.executor, this.tableName);

  Future<List<CompteBalanceRef>> getAllData() async {
    var data = <CompteBalanceRef>{};

    var querySQL = "SELECT * FROM $tableName;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CompteBalanceRef.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CompteBalanceRef data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, reference, comptes, debit, credit, solde)"
        "VALUES (nextval('comptes_balances_ref_id_seq'), @1, @2, @3, @4, @5)",
        substitutionValues: {
          '1': data.reference,
          '2': data.comptes,
          '3': data.debit,
          '4': data.credit,
          '5': data.solde
        });
    });
  }

  Future<void> update(CompteBalanceRef data) async {
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET reference = @1, comptes = @2, debit = @3, credit = @4,"
        "solde = @5 WHERE id = @6",
        substitutionValues: {
          '1': data.reference,
          '2': data.comptes,
          '3': data.debit,
          '4': data.credit,
          '5': data.solde,
          '6': data.id
        });
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

  Future<CompteBalanceRef> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM $tableName WHERE \"id\" = '$id'");
    return CompteBalanceRef(
      id: data[0][0],
      reference: data[0][1],
      comptes: data[0][2],
      debit: data[0][3],
      credit: data[0][4],
      solde: data[0][5]
    );
  }
}
