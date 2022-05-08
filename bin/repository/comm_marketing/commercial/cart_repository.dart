import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/cart_model.dart';

class CartRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CartRepository(this.executor, this.tableName);


  Future<List<CartModel>> getAllData() async {
    var data = <CartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CartModel cartModel) async {
    var idProductCart = cartModel.idProductCart;
    var quantityCart = cartModel.quantityCart;
    var priceCart = cartModel.priceCart;
    var priceAchatUnit = cartModel.priceAchatUnit;
    var unite = cartModel.unite;
    var tva = cartModel.tva;
    var remise = cartModel.remise;
    var qtyRemise = cartModel.qtyRemise;
    var succursale = cartModel.succursale;
    var signature = cartModel.signature;
    var created = cartModel.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('carts_id_seq'), '$idProductCart',"
        "'$quantityCart', '$priceCart','$priceAchatUnit', '$unite',"
        "'$tva', '$remise', '$qtyRemise',"
        "'$succursale', '$signature', '$created');");
    });
  }

  Future<void> update(CartModel cartModel) async {
    var id = cartModel.id;
    var idProductCart = cartModel.idProductCart;
    var quantityCart = cartModel.quantityCart;
    var priceCart = cartModel.priceCart;
    var priceAchatUnit = cartModel.priceAchatUnit;
    var unite = cartModel.unite;
    var tva = cartModel.tva;
    var remise = cartModel.remise;
    var qtyRemise = cartModel.qtyRemise;
    var succursale = cartModel.succursale;
    var signature = cartModel.signature;
    var created = cartModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProductCart\"='$idProductCart', \"quantityCart\"='$quantityCart',"
        "\"priceCart\"='$priceCart',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"unite\"='$unite',"
        "\"tva\"='$tva', \"remise\"='$remise', \"qtyRemise\"='$qtyRemise',"
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

  deleteAllData(String succursale) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE succursale=$succursale;');
      });
    } catch (e) {
      'erreur $e';
    }
  }

  Future<CartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
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
      created: data[0][11]
    );
  } 
  
}