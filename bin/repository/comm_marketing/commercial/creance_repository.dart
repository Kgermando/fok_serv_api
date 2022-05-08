import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/creance_cart_model.dart';

class CreanceFactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CreanceFactureRepository(this.executor, this.tableName);


  Future<List<CreanceCartModel>> getAllData() async {
    var data = <CreanceCartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CreanceCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CreanceCartModel factureCartModel) async {

    var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var succursale = factureCartModel.succursale;
    var signature = factureCartModel.signature;
    var created = factureCartModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('creance_factures_id_seq'), '$cart', '$client',"
        "'$succursale', '$signature','$created');");
    });
  }

  Future<void> update(CreanceCartModel factureCartModel) async {
    var id = factureCartModel.id;
    var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var succursale = factureCartModel.succursale;
    var signature = factureCartModel.signature;
    var created = factureCartModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"cart\"='$cart', \"client\"='$client',"
        "\"succursale\"='$succursale',"
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

  Future<CreanceCartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CreanceCartModel(
      id: data[0][0],
      cart: data[0][1],
      client: data[0][2],
      succursale: data[0][3],
      signature: data[0][4],
      created: data[0][5]
    );
  } 
}