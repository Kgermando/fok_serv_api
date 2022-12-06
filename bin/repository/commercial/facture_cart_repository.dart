import 'package:postgres/postgres.dart';

import '../../models/comm_maketing/facture_cart_model.dart';

class FactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  FactureRepository(this.executor, this.tableName);


  Future<List<FactureCartModel>> getAllData() async {
    var data = <FactureCartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(FactureCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(FactureCartModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, cart, client,"
          "succursale, signature, created)"
          "VALUES (nextval('factures_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.cart,
            '2': data.client,
            '3': data.succursale,
            '4': data.signature,
            '5': data.created
          });
    }); 
  }

  Future<void> update(FactureCartModel data) async {
     await executor.query("""UPDATE $tableName
      SET cart = @1, client = @2, succursale = @3,
          signature = @4, created = @5 WHERE id = @6""", substitutionValues: {
      '1': data.cart,
      '2': data.client,
      '3': data.succursale,
      '4': data.signature,
      '5': data.created,
      '6': data.id
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

  Future<FactureCartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return FactureCartModel(
        id: data[0][0],
        cart: data[0][1],
        client: data[0][2],
        succursale: data[0][3],
        signature: data[0][4],
        created: data[0][5]);
  } 
}