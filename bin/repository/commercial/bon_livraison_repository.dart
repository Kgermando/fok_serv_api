import 'package:postgres/postgres.dart';

import '../../models/commercial/bon_livraison.dart';

class BonLivraisonRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BonLivraisonRepository(this.executor, this.tableName);

  Future<List<BonLivraisonModel>> getAllData(String business) async {
    var data = <BonLivraisonModel>{};

    var querySQL =
        "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BonLivraisonModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BonLivraisonModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, id_product,"
          "quantity_achat, price_achat_unit, prix_vente_unit, unite,"
          "first_name, last_name, tva,"
          "remise, qty_remise, accuse_reception, accuse_reception_first_name,"
          "accuse_reception_last_name, succursale, signature, created, business, sync, async)"
          "VALUES (nextval('bon_livraisons_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12,"
          "@13, @14, @15, @16, @17, @18, @19)",
          substitutionValues: {
            '1': data.idProduct,
            '2': data.quantityAchat,
            '3': data.priceAchatUnit,
            '4': data.prixVenteUnit,
            '5': data.unite,
            '6': data.firstName,
            '7': data.lastName,
            '8': data.tva,
            '9': data.remise,
            '10': data.qtyRemise,
            '11': data.accuseReception,
            '12': data.accuseReceptionFirstName,
            '13': data.accuseReceptionLastName,
            '14': data.succursale,
            '15': data.signature,
            '16': data.created,
            '17': data.business,
            '18': data.sync,
            '19': data.async,
          });
    });
  }

  Future<void> update(BonLivraisonModel data) async {
    await executor.query("""UPDATE $tableName
      SET id_product = @1, quantity_achat = @2,
        price_achat_unit = @3, prix_vente_unit = @4, unite = @5,
        first_name = @6, last_name = @7, tva = @8,
        remise = @9, qty_remise = @10, accuse_reception = @11,
        accuse_reception_first_name = @12, accuse_reception_last_name = @13,
        succursale = @14, signature = @15, created = @16, business = @17,
        sync = @18, async = @19 WHERE id = @20""", substitutionValues: {
      '1': data.idProduct,
      '2': data.quantityAchat,
      '3': data.priceAchatUnit,
      '4': data.prixVenteUnit,
      '5': data.unite,
      '6': data.firstName,
      '7': data.lastName,
      '8': data.tva,
      '9': data.remise,
      '10': data.qtyRemise,
      '11': data.accuseReception,
      '12': data.accuseReceptionFirstName,
      '13': data.accuseReceptionLastName,
      '14': data.succursale,
      '15': data.signature,
      '16': data.created,
      '17': data.business,
      '18': data.sync,
      '19': data.async,
      '20': data.id
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

  Future<BonLivraisonModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BonLivraisonModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantityAchat: data[0][2],
      priceAchatUnit: data[0][3],
      prixVenteUnit: data[0][4],
      unite: data[0][5],
      firstName: data[0][6],
      lastName: data[0][7],
      tva: data[0][8],
      remise: data[0][9],
      qtyRemise: data[0][10],
      accuseReception: data[0][11],
      accuseReceptionFirstName: data[0][12],
      accuseReceptionLastName: data[0][13],
      succursale: data[0][14],
      signature: data[0][15],
      created: data[0][16],
      business: data[0][17],
      sync: data[0][18],
      async: data[0][19],
    );
  }
}
