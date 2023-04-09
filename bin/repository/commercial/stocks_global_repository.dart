import 'package:postgres/postgres.dart';

import '../../models/commercial/stocks_global_model.dart';

class StockGlobalRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  StockGlobalRepository(this.executor, this.tableName);


  Future<List<StocksGlobalMOdel>> getAllData(
    String business
  ) async {
    var data = <StocksGlobalMOdel>{};

    var querySQL = "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(StocksGlobalMOdel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(StocksGlobalMOdel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, id_product, quantity,"
        "quantity_achat, price_achat_unit, prix_vente_unit, unite, mode_achat,"
        "tva, qty_ravitailler, signature, created, business, sync, async)"
        "VALUES (nextval('stocks_global_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14)",
        substitutionValues: {
          '1': data.idProduct,
          '2': data.quantity,
          '3': data.quantityAchat,
          '4': data.priceAchatUnit,
          '5': data.prixVenteUnit,
          '6': data.unite,
          '7': data.modeAchat,
          '8': data.tva,
          '9': data.qtyRavitailler,
          '10': data.signature,
          '11': data.created,
          '12': data.business,
          '13': data.sync,
          '14': data.async
        });
    });
  }

  Future<void> update(StocksGlobalMOdel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product = @1, quantity = @2, quantity_achat = @3,
          price_achat_unit = @4, prix_vente_unit = @5, unite = @6,
          mode_achat = @7, tva = @8, qty_ravitailler = @9,
          signature = @10, created = @11, business = @12,
          sync = @13, async = @14 WHERE id = @15""",
        substitutionValues: {
          '1': data.idProduct,
          '2': data.quantity,
          '3': data.quantityAchat,
          '4': data.priceAchatUnit,
          '5': data.prixVenteUnit,
          '6': data.unite,
          '7': data.modeAchat,
          '8': data.tva,
          '9': data.qtyRavitailler,
          '10': data.signature,
          '11': data.created,
          '12': data.business,
          '13': data.sync,
          '14': data.async,
          '15': data.id
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
      created: data[0][11],
      business: data[0][12],
      sync: data[0][13],
      async: data[0][14],
    );
  } 
}