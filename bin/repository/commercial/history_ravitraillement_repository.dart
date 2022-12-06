import 'package:postgres/postgres.dart';

import '../../models/comm_maketing/history_ravitaillement_model.dart';

class HistoryRavitaillementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  HistoryRavitaillementRepository(this.executor, this.tableName);


  Future<List<HistoryRavitaillementModel>> getAllData() async {
    var data = <HistoryRavitaillementModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(HistoryRavitaillementModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(HistoryRavitaillementModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product, quantity,"
          "quantity_achat, price_achat_unit, prix_vente_unit, unite, marge_ben,"
          "tva, qty_ravitailler, succursale, signature, created)"
          "VALUES (nextval('history_ravitaillements_id_seq'), @1, @2, @3, @4,"
          "@5, @6, @7, @8, @9, @10, @11, @12)",
          substitutionValues: {
            '1': data.idProduct,
            '2': data.quantity,
            '3': data.quantityAchat,
            '4': data.priceAchatUnit,
            '5': data.prixVenteUnit,
            '6': data.unite,
            '7': data.margeBen,
            '8': data.tva,
            '9': data.qtyRavitailler,
            '10': data.succursale,
            '11': data.signature,
            '12': data.created
          });
    });
  }

  Future<void> update(HistoryRavitaillementModel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product = @1, quantity = @2, quantity_achat = @3,
          price_achat_unit = @4, prix_vente_unit = @5, unite = @6,
          marge_ben = @7, tva = @8,
          qty_ravitailler = @9, succursale = @10,
          signature = @11, created = @12 WHERE id = @13""",
        substitutionValues: {
          '1': data.idProduct,
          '2': data.quantity,
          '3': data.quantityAchat,
          '4': data.priceAchatUnit,
          '5': data.prixVenteUnit,
          '6': data.unite,
          '7': data.margeBen,
          '8': data.tva,
          '9': data.qtyRavitailler,
          '10': data.succursale,
          '11': data.signature,
          '12': data.created,
          '13': data.id
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

  Future<HistoryRavitaillementModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return HistoryRavitaillementModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      margeBen: data[0][7],
      tva: data[0][8],
      qtyRavitailler: data[0][9],
      succursale: data[0][10],
      signature: data[0][11],
      created: data[0][12]
    );
  } 
}