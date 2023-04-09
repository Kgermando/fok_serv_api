import 'package:postgres/postgres.dart';

import '../../models/commercial/facture_cart_model.dart';

class FactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  FactureRepository(this.executor, this.tableName);


  Future<List<FactureCartModel>> getAllData(String business) async {
    var data = <FactureCartModel>{};

    var querySQL = "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
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
          "nom_client, telephone,"
          "succursale, signature, created, business, sync, async)"
          "VALUES (nextval('factures_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)",
          substitutionValues: {
            '1': data.cart,
            '2': data.client,
            '3': data.nomClient,
            '4': data.telephone,
            '5': data.succursale,
            '6': data.signature,
            '7': data.created,
            '8': data.business,
            '9': data.sync,
            '10': data.async,
          });
    }); 
  }

  Future<void> update(FactureCartModel data) async {
     await executor.query("""UPDATE $tableName
      SET cart = @1, client = @2, nom_client = @3,
        telephone = @4, succursale = @5,
          signature = @6, created = @7, business = @8, 
          sync = @9, async = @10 WHERE id = @11""", substitutionValues: {
      '1': data.cart,
      '2': data.client,
      '3': data.nomClient,
      '4': data.telephone,
      '5': data.succursale,
      '6': data.signature,
      '7': data.created,
      '8': data.business,
      '9': data.sync,
      '10': data.async,
      '11': data.id
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
      nomClient: data[0][3],
      telephone: data[0][4],
      succursale: data[0][5],
      signature: data[0][6],
      created: data[0][7],
      business: data[0][8],
      sync: data[0][9],
      async: data[0][10],
    );
  } 
}