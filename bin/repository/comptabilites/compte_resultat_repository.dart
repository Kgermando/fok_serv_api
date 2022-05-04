import 'package:postgres/postgres.dart';

import '../../models/comptabilites/compte_resultat_model.dart';

class CompteResultatRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CompteResultatRepository(this.executor, this.tableName);

  Future<List<CompteResulatsModel>> getAllData() async {
    var data = <CompteResulatsModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CompteResulatsModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CompteResulatsModel compteResulatsModel) async {
    var intitule = compteResulatsModel.intitule;
    var compteListDebit = compteResulatsModel.compteListDebit;
    var compteListCredit = compteResulatsModel.compteListCredit;
    var statut = compteResulatsModel.statut;
    var approbationDG = compteResulatsModel.approbationDG;
    var signatureDG = compteResulatsModel.signatureDG;
    var signatureJustificationDG =
        compteResulatsModel.signatureJustificationDG;

    var approbationDD = compteResulatsModel.approbationDD;
    var signatureDD = compteResulatsModel.signatureDD;
    var signatureJustificationDD =
        compteResulatsModel.signatureJustificationDD;

    var signature = compteResulatsModel.signature;
    var created = compteResulatsModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('comptes_resultat_id_seq'), '$intitule',"
        "'$compteListDebit','$compteListCredit','$statut',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG',"
        "'$approbationDD', '$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(CompteResulatsModel compteResulatsModel) async {
    var id = compteResulatsModel.id;
    var intitule = compteResulatsModel.intitule;
    var compteListDebit = compteResulatsModel.compteListDebit;
    var compteListCredit = compteResulatsModel.compteListCredit;
    var statut = compteResulatsModel.statut;
    var approbationDG = compteResulatsModel.approbationDG;
    var signatureDG = compteResulatsModel.signatureDG;
    var signatureJustificationDG = compteResulatsModel.signatureJustificationDG;

    var approbationDD = compteResulatsModel.approbationDD;
    var signatureDD = compteResulatsModel.signatureDD;
    var signatureJustificationDD = compteResulatsModel.signatureJustificationDD;

    var signature = compteResulatsModel.signature;
    var created = compteResulatsModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"intitule\"='$intitule', "
        "\"compteListDebit\"='$compteListDebit', \"compteListCredit\"='$compteListCredit',"
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

  Future<CompteResulatsModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CompteResulatsModel(
     id: data[0][0],
      intitule: data[0][1],
      compteListDebit: data[0][2],
      compteListCredit: data[0][3],
      statut: data[0][4],
      approbationDG: data[0][5],
      signatureDG: data[0][6],
      signatureJustificationDG: data[0][7],
      approbationDD: data[0][8],
      signatureDD: data[0][9],
      signatureJustificationDD: data[0][10],
      signature: data[0][11],
      created: data[0][12]   
    );
  } 
}