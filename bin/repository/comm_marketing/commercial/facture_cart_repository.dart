import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/facture_cart_model.dart';

class FactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  FactureRepository(this.executor, this.tableName);


  Future<List<FactureCartModel>> getAllData() async {
    var data = <FactureCartModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(FactureCartModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(FactureCartModel factureCartModel) async {

   var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var approbationDG = factureCartModel.approbationDG;
    var signatureDG = factureCartModel.signatureDG;
    var signatureJustificationDG = factureCartModel.signatureJustificationDG;

    var approbationFin = factureCartModel.approbationFin;
    var signatureFin = factureCartModel.signatureFin;
    var signatureJustificationFin = factureCartModel.signatureJustificationFin;

    var approbationBudget = factureCartModel.approbationBudget;
    var signatureBudget = factureCartModel.signatureBudget;
    var signatureJustificationBudget =
        factureCartModel.signatureJustificationBudget;

    var approbationDD = factureCartModel.approbationDD;
    var signatureDD = factureCartModel.signatureDD;
    var signatureJustificationDD = factureCartModel.signatureJustificationDD;
    var succursale = factureCartModel.succursale;
    var signature = factureCartModel.signature;
    var created = factureCartModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('creance_factures_id_seq'), '$cart', '$client'"
          "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD', '$succursale',"
          "'$signature','$created');");
    });
  }

  Future<void> update(FactureCartModel factureCartModel) async {
    var id = factureCartModel.id;
    var cart = factureCartModel.cart;
    var client = factureCartModel.client;
    var approbationDG = factureCartModel.approbationDG;
    var signatureDG = factureCartModel.signatureDG;
    var signatureJustificationDG = factureCartModel.signatureJustificationDG;

    var approbationFin = factureCartModel.approbationFin;
    var signatureFin = factureCartModel.signatureFin;
    var signatureJustificationFin = factureCartModel.signatureJustificationFin;

    var approbationBudget = factureCartModel.approbationBudget;
    var signatureBudget = factureCartModel.signatureBudget;
    var signatureJustificationBudget =
        factureCartModel.signatureJustificationBudget;

    var approbationDD = factureCartModel.approbationDD;
    var signatureDD = factureCartModel.signatureDD;
    var signatureJustificationDD = factureCartModel.signatureJustificationDD;
    var succursale = factureCartModel.succursale;
    var signature = factureCartModel.signature;
    var created = factureCartModel.created;

   await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"cart\"='$cart', \"client\"='$client',"
          "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
          "\"signatureJustificationDG\"='$signatureJustificationDG',"
          "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
          "\"signatureJustificationFin\"='$signatureJustificationFin',"
          "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
          "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
          "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
          "\"signatureJustificationDD\"='$signatureJustificationDD', \"succursale\"='$succursale',"
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

  Future<FactureCartModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return FactureCartModel(
        id: data[0][0],
        cart: data[0][1],
        client: data[0][2],
        approbationDG: data[0][3],
        signatureDG: data[0][4],
        signatureJustificationDG: data[0][5],
        approbationFin: data[0][6],
        signatureFin: data[0][7],
        signatureJustificationFin: data[0][8],
        approbationBudget: data[0][9],
        signatureBudget: data[0][10],
        signatureJustificationBudget: data[0][11],
        approbationDD: data[0][12],
        signatureDD: data[0][13],
        signatureJustificationDD: data[0][14],
        succursale: data[0][15],
        signature: data[0][16],
        created: data[0][17]);
  } 
}