import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/history_ravitaillement_model.dart';

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

  Future<void> insertData(HistoryRavitaillementModel historyRavitaillementModel) async {
    var idProduct = historyRavitaillementModel.idProduct;
    var quantity = historyRavitaillementModel.quantity;
    var quantityAchat = historyRavitaillementModel.quantityAchat;
    var priceAchatUnit = historyRavitaillementModel.priceAchatUnit;
    var prixVenteUnit = historyRavitaillementModel.prixVenteUnit;
    var unite = historyRavitaillementModel.unite;
    var margeBen = historyRavitaillementModel.margeBen;
    var tva = historyRavitaillementModel.tva;
    var qtyRavitailler = historyRavitaillementModel.qtyRavitailler;

    var succursale = historyRavitaillementModel.succursale;
    var signature = historyRavitaillementModel.signature;
    var created = historyRavitaillementModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('history_ravitaillements_id_seq'), '$idProduct',"
        "'$quantity','$quantityAchat','$priceAchatUnit', '$prixVenteUnit', '$unite',"
        "'$margeBen', '$tva', '$qtyRavitailler',"
        "'$succursale', '$signature', '$created');");
    });
  }

  Future<void> update(HistoryRavitaillementModel historyRavitaillementModel) async {
    var id = historyRavitaillementModel.id;
    var idProduct = historyRavitaillementModel.idProduct;
    var quantity = historyRavitaillementModel.quantity;
    var quantityAchat = historyRavitaillementModel.quantityAchat;
    var priceAchatUnit = historyRavitaillementModel.priceAchatUnit;
    var prixVenteUnit = historyRavitaillementModel.prixVenteUnit;
    var unite = historyRavitaillementModel.unite;
    var margeBen = historyRavitaillementModel.margeBen;
    var tva = historyRavitaillementModel.tva;
    var qtyRavitailler = historyRavitaillementModel.qtyRavitailler;

    var succursale = historyRavitaillementModel.succursale;
    var signature = historyRavitaillementModel.signature;
    var created = historyRavitaillementModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"quantityAchat\"='$quantityAchat',\"priceAchatUnit\"='$priceAchatUnit',"
        "\"prixVenteUnit\"='$prixVenteUnit',\"unite\"='$unite', \"margeBen\"='$margeBen',"
        "\"tva\"='$tva', \"qtyRavitailler\"='$qtyRavitailler',"
        "\"succursale\"='$succursale', \"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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