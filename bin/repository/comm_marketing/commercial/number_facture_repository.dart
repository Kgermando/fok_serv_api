import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/number_facture.dart';

class NumberFactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  NumberFactureRepository(this.executor, this.tableName);


  Future<List<NumberFactureModel>> getAllData() async {
    var data = <NumberFactureModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(NumberFactureModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(NumberFactureModel factureCartModel) async {

    var number = factureCartModel.number;
    var approbationDG = factureCartModel.approbationDG;
    var signatureDG = factureCartModel.signatureDG;
    var signatureJustificationDG =
        factureCartModel.signatureJustificationDG;

    var approbationFin = factureCartModel.approbationFin;
    var signatureFin = factureCartModel.signatureFin;
    var signatureJustificationFin =
        factureCartModel.signatureJustificationFin;

    var approbationBudget = factureCartModel.approbationBudget;
    var signatureBudget = factureCartModel.signatureBudget;
    var signatureJustificationBudget =
        factureCartModel.signatureJustificationBudget;

    var approbationDD = factureCartModel.approbationDD;
    var signatureDD = factureCartModel.signatureDD;
    var signatureJustificationDD =
        factureCartModel.signatureJustificationDD;

    var signature = factureCartModel.signature;
    var created = factureCartModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('number_factures_id_seq'), '$number',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
          "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
          "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
          "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(NumberFactureModel factureCartModel) async {
    var id = factureCartModel.id;
    var number = factureCartModel.number;
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

    var signature = factureCartModel.signature;
    var created = factureCartModel.created;
    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"number\"='$number',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
          "\"signatureJustificationDG\"='$signatureJustificationDG',"
          "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
          "\"signatureJustificationFin\"='$signatureJustificationFin',"
          "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
          "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
          "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
          "\"signatureJustificationDD\"='$signatureJustificationDD',"
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

  Future<NumberFactureModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return NumberFactureModel(
      id: data[0][0],
      number: data[0][1],
      approbationDG: data[0][2],
        signatureDG: data[0][3],
        signatureJustificationDG: data[0][4],
        approbationFin: data[0][5],
        signatureFin: data[0][6],
        signatureJustificationFin: data[0][7],
        approbationBudget: data[0][8],
        signatureBudget: data[0][9],
        signatureJustificationBudget: data[0][10],
        approbationDD: data[0][11],
        signatureDD: data[0][12],
        signatureJustificationDD: data[0][13],
        succursale: data[0][14],
        signature: data[0][15],
        created: data[0][16]
    );
  } 
}