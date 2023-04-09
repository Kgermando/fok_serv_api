import 'package:postgres/postgres.dart';

import '../../models/commercial/livraiason_history_model.dart';

class HistoryLivraisonRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  HistoryLivraisonRepository(this.executor, this.tableName);

  Future<List<LivraisonHistoryModel>> getAllData(String business) async {
    var data = <LivraisonHistoryModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(LivraisonHistoryModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(LivraisonHistoryModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product, quantity,"
          "quantity_achat, price_achat_unit, prix_vente_unit, unite, marge_ben,"
          "tva, remise, qty_remise, marge_ben_remise, qty_livre,"
          "succursale, signature, created, business, sync, async)"
          "VALUES (nextval('history_livraisons_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18)",
          substitutionValues: {
            '1': data.idProduct,
            '2': data.quantity,
            '3': data.quantityAchat,
            '4': data.priceAchatUnit,
            '5': data.prixVenteUnit,
            '6': data.unite,
            '7': data.margeBen,
            '8': data.tva,
            '9': data.remise,
            '10': data.qtyRemise,
            '11': data.margeBenRemise,
            '12': data.qtyLivre,
            '13': data.succursale,
            '14': data.signature,
            '15': data.created,
            '16': data.business,
            '17': data.sync,
            '18': data.async,
          });
    });
  }

  Future<void> update(LivraisonHistoryModel data) async {
    await executor.query("""UPDATE $tableName
          SET id_product = @1, quantity = @2, quantity_achat = @3,
          price_achat_unit = @4, prix_vente_unit = @5, unite = @6,
          marge_ben = @7, tva = @8, remise = @9, qty_remise = @10,
          marge_ben_remise = @11, qty_livre = @12, succursale = @13,
          signature = @14, created = @15, business = @16, 
          sync = @17, async = @18 WHERE id = @19""", substitutionValues: {
      '1': data.idProduct,
      '2': data.quantity,
      '3': data.quantityAchat,
      '4': data.priceAchatUnit,
      '5': data.prixVenteUnit,
      '6': data.unite,
      '7': data.margeBen,
      '8': data.tva,
      '9': data.remise,
      '10': data.qtyRemise,
      '11': data.margeBenRemise,
      '12': data.qtyLivre,
      '13': data.succursale,
      '14': data.signature,
      '15': data.created,
      '16': data.business,
      '17': data.sync,
      '18': data.async,
      '19': data.id
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

  Future<LivraisonHistoryModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return LivraisonHistoryModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      margeBen: data[0][7],
      tva: data[0][8],
      remise: data[0][9],
      qtyRemise: data[0][10],
      margeBenRemise: data[0][11],
      qtyLivre: data[0][12],
      succursale: data[0][13],
      signature: data[0][14],
      created: data[0][15],
      business: data[0][16],
      sync: data[0][6],
      async: data[0][7],
    );
  }
}
