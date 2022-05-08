import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/stocks_global_model.dart';

class StockGlobalRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  StockGlobalRepository(this.executor, this.tableName);


  Future<List<StocksGlobalMOdel>> getAllData() async {
    var data = <StocksGlobalMOdel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(StocksGlobalMOdel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(StocksGlobalMOdel stocksGlobalMOdel) async {
    var idProduct = stocksGlobalMOdel.idProduct;
    var quantity = stocksGlobalMOdel.quantity;
    var quantityAchat = stocksGlobalMOdel.quantityAchat;
    var priceAchatUnit = stocksGlobalMOdel.priceAchatUnit;
    var prixVenteUnit = stocksGlobalMOdel.prixVenteUnit;
    var unite = stocksGlobalMOdel.unite;
    var modeAchat = stocksGlobalMOdel.modeAchat;
    var tva = stocksGlobalMOdel.tva;
    var qtyRavitailler = stocksGlobalMOdel.qtyRavitailler;

    var signature = stocksGlobalMOdel.signature;
    var created = stocksGlobalMOdel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('stocks_global_id_seq'), '$idProduct',"
        "'$quantity','$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$modeAchat', '$tva', '$qtyRavitailler',"
        "'$signature','$created');");
    });
  }

  Future<void> update(StocksGlobalMOdel stocksGlobalMOdel) async {
    var id = stocksGlobalMOdel.id;
    var idProduct = stocksGlobalMOdel.idProduct;
    var quantity = stocksGlobalMOdel.quantity;
    var quantityAchat = stocksGlobalMOdel.quantityAchat;
    var priceAchatUnit = stocksGlobalMOdel.priceAchatUnit;
    var prixVenteUnit = stocksGlobalMOdel.prixVenteUnit;
    var unite = stocksGlobalMOdel.unite;
    var modeAchat = stocksGlobalMOdel.modeAchat;
    var tva = stocksGlobalMOdel.tva;
    var qtyRavitailler = stocksGlobalMOdel.qtyRavitailler;

    var signature = stocksGlobalMOdel.signature;
    var created = stocksGlobalMOdel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"quantityAchat\"='$quantityAchat',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"prixVenteUnit\"='$prixVenteUnit',\"unite\"='$unite', \"modeAchat\"='$modeAchat',"
        "\"tva\"='$tva', \"qtyRavitailler\"='$qtyRavitailler',"
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

  Future<StocksGlobalMOdel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return StocksGlobalMOdel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      modeAchat: data[0][7],
      tva: data[0][8],
      qtyRavitailler: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  } 
}