import 'package:postgres/postgres.dart';

import '../../models/commercial/achat_model.dart';

class AchatsRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AchatsRepository(this.executor, this.tableName);

 
  Future<List<AchatModel>> getAllData(String business) async {
    var data = <AchatModel>{};

    var querySQL = "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AchatModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AchatModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product, quantity,"
          "quantity_achat, price_achat_unit, prix_vente_unit, unite, tva,"
          "remise, qty_remise, qty_livre, succursale, signature, created,"
          "business, sync, async)"
          "VALUES (nextval('achats_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16)",
          substitutionValues: {
            '1': data.idProduct,
            '2': data.quantity,
            '3': data.quantityAchat,
            '4': data.priceAchatUnit,
            '5': data.prixVenteUnit,
            '6': data.unite,
            '7': data.tva,
            '8': data.remise,
            '9': data.qtyRemise,
            '10': data.qtyLivre,
            '11': data.succursale,
            '12': data.signature,
            '13': data.created,
            '14': data.business,
            '15': data.sync,
            '16': data.async,
          });
    });
  }

  Future<void> update(AchatModel data) async {
   await executor.query("""UPDATE $tableName
          SET id_product = @1, quantity = @2, quantity_achat = @3,
          price_achat_unit = @4, prix_vente_unit = @5, unite = @6, tva = @7,
          remise = @8, qty_remise = @9, qty_livre = @10, succursale = @11,
          signature = @12, created = @13, business = @14, sync = @15, 
          async = @16 WHERE id = @17""",
        substitutionValues: {
          '1': data.idProduct,
          '2': data.quantity,
          '3': data.quantityAchat,
          '4': data.priceAchatUnit,
          '5': data.prixVenteUnit,
          '6': data.unite,
          '7': data.tva,
          '8': data.remise,
          '9': data.qtyRemise,
          '10': data.qtyLivre,
          '11': data.succursale,
          '12': data.signature,
          '13': data.created,
          '14': data.business,
          '15': data.sync,
          '16': data.async,
          '17': data.id
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

  Future<AchatModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AchatModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      quantityAchat: data[0][3],
      priceAchatUnit: data[0][4],
      prixVenteUnit: data[0][5],
      unite: data[0][6],
      tva: data[0][7],
      remise: data[0][8],
      qtyRemise: data[0][9],
      qtyLivre: data[0][10],
      succursale: data[0][11],
      signature: data[0][12],
      created: data[0][13],
      business: data[0][14],
      sync: data[0][15],
      async: data[0][16],
    );
  } 
}