import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_comptes_model.dart';

class BalanceCompteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceCompteRepository(this.executor, this.tableName);

  Future<List<BalanceCompteModel>> getAllData() async {
    var data = <BalanceCompteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceCompteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BalanceCompteModel balanceCompteModel) async {
    var title = balanceCompteModel.title;
    var comptes = balanceCompteModel.comptes;
    var statut = balanceCompteModel.statut;
    var signature = balanceCompteModel.signature;
    var created = balanceCompteModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('balance_comptes_id_seq'), '$title',"
        "'$comptes', '$statut',"
        "'$signature','$created');");
    });
  }

  Future<void> update(BalanceCompteModel balanceCompteModel) async {
    var id = balanceCompteModel.id;
    var title = balanceCompteModel.title;
    var comptes = balanceCompteModel.comptes;
    var statut = balanceCompteModel.statut;

    var signature = balanceCompteModel.signature;
    var created = balanceCompteModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"title\"='$title', \"comptes\"='$comptes',"
        "\"statut\"='$statut',"
        "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
    });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      });
    } catch (e) {
      'erreur $e';
    }
  }

  Future<BalanceCompteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BalanceCompteModel(
      id: data[0][0],
      title: data[0][1],
      comptes: data[0][2],
      statut: data[0][3],
      signature: data[0][4],
      created: data[0][5]
    );
  } 
}