import 'package:postgres/postgres.dart';

import '../../models/comptabilites/journal_model.dart';

class JournalRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  JournalRepository(this.executor, this.tableName);

  Future<List<JournalModel>> getAllData() async {
    var data = <JournalModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(JournalModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(JournalModel journalModel) async {
    var libele = journalModel.libele;
    var compteDebit = journalModel.compteDebit;
    var montantDebit = journalModel.montantDebit;
    var compteCredit = journalModel.compteCredit;
    var montantCredit = journalModel.montantCredit;
    var remarque = journalModel.remarque;
    var statut = journalModel.statut;

    var approbationDG = journalModel.approbationDG;
    var signatureDG = journalModel.signatureDG;
    var signatureJustificationDG =
        journalModel.signatureJustificationDG;

    var approbationDD = journalModel.approbationDD;
    var signatureDD = journalModel.signatureDD;
    var signatureJustificationDD =
        journalModel.signatureJustificationDD;

    var signature = journalModel.signature;
    var created = journalModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('journals_id_seq'), '$libele',"
        "'$compteDebit','$montantDebit','$compteCredit','$montantCredit',"
        "'$remarque', '$statut',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG',"
        "'$approbationDD', '$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(JournalModel journalModel) async {
    var id = journalModel.id;
    var libele = journalModel.libele;
    var compteDebit = journalModel.compteDebit;
    var montantDebit = journalModel.montantDebit;
    var compteCredit = journalModel.compteCredit;
    var montantCredit = journalModel.montantCredit;
    var remarque = journalModel.remarque;
    var statut = journalModel.statut;

    var approbationDG = journalModel.approbationDG;
    var signatureDG = journalModel.signatureDG;
    var signatureJustificationDG = journalModel.signatureJustificationDG;

    var approbationDD = journalModel.approbationDD;
    var signatureDD = journalModel.signatureDD;
    var signatureJustificationDD = journalModel.signatureJustificationDD;

    var signature = journalModel.signature;
    var created = journalModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"libele\"='$libele', "
          "\"compteDebit\"='$compteDebit',\"montantDebit\"='$montantDebit',"
          "\"compteCredit\"='$compteCredit',\"montantCredit\"='$montantCredit',"
          "\"remarque\"='$remarque', \"statut\"='$statut',"
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

  Future<JournalModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return JournalModel(
      id: data[0][0],
      libele: data[0][1],
      compteDebit: data[0][2],
      montantDebit: data[0][3],
      compteCredit: data[0][4],
      montantCredit: data[0][5],
      remarque: data[0][6],
      statut: data[0][7],
      approbationDG: data[0][8],
      signatureDG: data[0][9],
      signatureJustificationDG: data[0][10],
      approbationDD: data[0][11],
      signatureDD: data[0][12],
      signatureJustificationDD: data[0][13],
      signature: data[0][14],
      created: data[0][15]
    );
  } 
}