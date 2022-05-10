import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_comptes_model.dart';

class BalanceCompteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceCompteRepository(this.executor, this.tableName);

  Future<List<BalanceCompteModel>> getAllData() async {
    var data = <BalanceCompteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceCompteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BalanceCompteModel balanceCompteModel) async {
    var title = balanceCompteModel.title;
    var comptes = balanceCompteModel.comptes;
    var statut = balanceCompteModel.statut;
    var approbationDG = balanceCompteModel.approbationDG;
    var signatureDG = balanceCompteModel.signatureDG;
    var signatureJustificationDG =
        balanceCompteModel.signatureJustificationDG;

    var approbationDD = balanceCompteModel.approbationDD;
    var signatureDD = balanceCompteModel.signatureDD;
    var signatureJustificationDD =
        balanceCompteModel.signatureJustificationDD;

    var signature = balanceCompteModel.signature;
    var created = balanceCompteModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('balance_comptes_id_seq'), '$title',"
        "'$comptes', '$statut',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG',"
        "'$approbationDD', '$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(BalanceCompteModel balanceCompteModel) async {
    var id = balanceCompteModel.id;
    var title = balanceCompteModel.title;
    var comptes = balanceCompteModel.comptes;
    var statut = balanceCompteModel.statut;
    var approbationDG = balanceCompteModel.approbationDG;
    var signatureDG = balanceCompteModel.signatureDG;
    var signatureJustificationDG = balanceCompteModel.signatureJustificationDG;

    var approbationDD = balanceCompteModel.approbationDD;
    var signatureDD = balanceCompteModel.signatureDD;
    var signatureJustificationDD = balanceCompteModel.signatureJustificationDD;

    var signature = balanceCompteModel.signature;
    var created = balanceCompteModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"title\"='$title', \"comptes\"='$comptes',"
        "\"statut\"='$statut',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
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

  Future<BalanceCompteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BalanceCompteModel(
      id: data[0][0],
      title: data[0][1],
      comptes: data[0][2],
      statut: data[0][3],
      approbationDG: data[0][4],
      signatureDG: data[0][5],
      signatureJustificationDG: data[0][6],
      approbationDD: data[0][7],
      signatureDD: data[0][8],
      signatureJustificationDD: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  } 
}