import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/facture_cart_model.dart';

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

  Future<void> insertData(FactureCartModel factureCartModel) async {

    var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var created = factureCartModel.created;
    var telephone = factureCartModel.telephone;
    var succursale = factureCartModel.succursale;
    var nameBusiness = factureCartModel.nameBusiness;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('factures_id_seq'), '$cart',"
        "'$client','$created','$telephone', '$succursale', '$nameBusiness');");
    });
  }

  Future<void> update(FactureCartModel factureCartModel) async {
    var id = factureCartModel.id;
    var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var created = factureCartModel.created;
    var telephone = factureCartModel.telephone;
    var succursale = factureCartModel.succursale;
    var nameBusiness = factureCartModel.nameBusiness;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"cart\"='$cart', \"client\"='$client',"
        "\"created\"='$created',\"telephone\"='$telephone',"
        "\"succursale\"='$succursale',\"nameBusiness\"='$nameBusiness' WHERE id=$id;");
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
      created: data[0][3],
      telephone: data[0][4],
      succursale: data[0][5],
      nameBusiness: data[0][6]
    );
  } 
}