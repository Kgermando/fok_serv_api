import 'package:postgres/postgres.dart';

import '../../models/commercial/prod_model.dart';

class ProduitModelRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ProduitModelRepository(this.executor, this.tableName);

  Future<List<ProductModel>> getAllData(String business) async {
    var data = <ProductModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ProductModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ProductModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, service, identifiant,"
          "unite, price, id_product, signature,"
          "created, business, sync, async)"
          "VALUES (nextval('produits_model_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10)",
          substitutionValues: {
            '1': data.service,
            '2': data.identifiant,
            '3': data.unite,
            '4': data.price,
            '5': data.idProduct,
            '6': data.signature,
            '7': data.created,
            '8': data.business,
            '9': data.sync,
            '10': data.async,
          });
    });
  }

  Future<void> update(ProductModel data) async {
    await executor.query("""UPDATE $tableName
          SET service = @1, identifiant = @2, unite = @3,
          price = @4, id_product = @5, signature = @6,
          created = @7, business = @8, sync = @9, async = @10 
          WHERE id = @11""", substitutionValues: {
      '1': data.service,
      '2': data.identifiant,
      '3': data.unite,
      '4': data.price,
      '5': data.idProduct,
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

  Future<ProductModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ProductModel(
      id: data[0][0],
      service: data[0][1],
      identifiant: data[0][2],
      unite: data[0][3],
      price: data[0][4],
      idProduct: data[0][5],
      signature: data[0][6],
      created: data[0][7],
      business: data[0][8],
      sync: data[0][9],
      async: data[0][10],
    );
  }
}
