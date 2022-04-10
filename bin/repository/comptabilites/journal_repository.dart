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
    var titleBilan = journalModel.titleBilan;
    var comptes = journalModel.comptes;
    var intitule = journalModel.intitule;
    var montant = journalModel.montant;
    var typeJournal = journalModel.typeJournal;
    var created = journalModel.created;
    var signature = journalModel.signature;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('journals_id_seq'), '$titleBilan',"
          "'$comptes','$intitule','$montant','$typeJournal','$created','$signature');");
    });
  }

  Future<void> update(JournalModel journalModel) async {
    var id = journalModel.id;
    var titleBilan = journalModel.titleBilan;
    var comptes = journalModel.comptes;
    var intitule = journalModel.intitule;
    var montant = journalModel.montant;
    var typeJournal = journalModel.typeJournal;
    var created = journalModel.created;
    var signature = journalModel.signature;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"titleBilan\"='$titleBilan', "
          "\"comptes\"='$comptes',\"intitule\"='$intitule',"
          "\"montant\"='$montant',\"typeJournal\"='$typeJournal',"
          "\"created\"='$created', \"signature\"='$signature' WHERE id=$id;");
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
        titleBilan: data[0][1],
        comptes: data[0][2],
        intitule: data[0][3],
        montant: data[0][4],
        typeJournal: data[0][5],
        created: data[0][6],
        signature: data[0][7]);
  } 
}