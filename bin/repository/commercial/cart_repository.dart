import 'package:postgres/postgres.dart';

import '../../models/commercial/cart_model.dart';

class CartRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CartRepository(this.executor, this.tableName);

  Future<List<CartModel>> getAllData(String business, String matricule) async {
    var data = <CartModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE WHERE \"business\"='$business' AND \"signature\"='$matricule' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CartModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product_cart, quantity_cart,"
          "price_cart, price_achat_unit, unite, tva,"
          "remise, qty_remise, succursale, signature, created, created_at, business)"
          "VALUES (nextval('carts_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15)",
          substitutionValues: {
            '1': data.idProductCart,
            '2': data.quantityCart,
            '3': data.priceCart,
            '4': data.priceAchatUnit,
            '5': data.unite,
            '6': data.tva,
            '7': data.remise,
            '8': data.qtyRemise,
            '9': data.succursale,
            '10': data.signature,
            '11': data.created,
            '12': data.createdAt,
            '13': data.business,
            '14': data.sync,
            '15': data.async,
          });
    });
  }

  Future<void> update(CartModel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product_cart = @1, quantity_cart = @2, price_cart = @3,
          price_achat_unit = @4, unite = @5, tva = @6,
          remise = @7, qty_remise = @8, succursale = @9,
          signature = @10, created = @11, created_at = @12, business = @13, 
          sync = @14, async = @15 WHERE id = @16""",
        substitutionValues: {
          '1': data.idProductCart,
          '2': data.quantityCart,
          '3': data.priceCart,
          '4': data.priceAchatUnit,
          '5': data.unite,
          '6': data.tva,
          '7': data.remise,
          '8': data.qtyRemise,
          '9': data.succursale,
          '10': data.signature,
          '11': data.created,
          '12': data.createdAt,
          '13': data.business,
          '14': data.sync,
          '15': data.async,
          '16': data.id
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

  deleteAllData(String signature) async {
    try {
      await executor.transaction((conn) async {
        await conn.execute(
            "DELETE FROM $tableName WHERE \"signature\"='$signature';");
      });
    } catch (e) {
      'erreur $e';
    }
  }

  Future<CartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id';");
    return CartModel(
        id: data[0][0],
        idProductCart: data[0][1],
        quantityCart: data[0][2],
        priceCart: data[0][3],
        priceAchatUnit: data[0][4],
        unite: data[0][5],
        tva: data[0][6],
        remise: data[0][7],
        qtyRemise: data[0][8],
        succursale: data[0][9],
        signature: data[0][10],
        created: data[0][11],
        createdAt: data[0][12],
        business: data[0][13],
        sync: data[0][14],
      async: data[0][15],
    );
  }
}
