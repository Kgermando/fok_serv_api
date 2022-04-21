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
    var approbationDG = journalModel.approbationDG;
    var signatureDG = journalModel.signatureDG;
    var signatureJustificationDG =
        journalModel.signatureJustificationDG;

    var approbationFin = journalModel.approbationFin;
    var signatureFin = journalModel.signatureFin;
    var signatureJustificationFin =
        journalModel.signatureJustificationFin;

    var approbationBudget = journalModel.approbationBudget;
    var signatureBudget = journalModel.signatureBudget;
    var signatureJustificationBudget =
        journalModel.signatureJustificationBudget;

    var approbationDD = journalModel.approbationDD;
    var signatureDD = journalModel.signatureDD;
    var signatureJustificationDD =
        journalModel.signatureJustificationDD;

    var signature = journalModel.signature;
    var created = journalModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('journals_id_seq'), '$titleBilan',"
        "'$comptes','$intitule','$montant','$typeJournal',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(JournalModel journalModel) async {
    var id = journalModel.id;
    var titleBilan = journalModel.titleBilan;
    var comptes = journalModel.comptes;
    var intitule = journalModel.intitule;
    var montant = journalModel.montant;
    var typeJournal = journalModel.typeJournal;
    var approbationDG = journalModel.approbationDG;
    var signatureDG = journalModel.signatureDG;
    var signatureJustificationDG =
        journalModel.signatureJustificationDG;

    var approbationFin = journalModel.approbationFin;
    var signatureFin = journalModel.signatureFin;
    var signatureJustificationFin =
        journalModel.signatureJustificationFin;

    var approbationBudget = journalModel.approbationBudget;
    var signatureBudget = journalModel.signatureBudget;
    var signatureJustificationBudget =
        journalModel.signatureJustificationBudget;

    var approbationDD = journalModel.approbationDD;
    var signatureDD = journalModel.signatureDD;
    var signatureJustificationDD =
        journalModel.signatureJustificationDD;

    var signature = journalModel.signature;
    var created = journalModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"titleBilan\"='$titleBilan', "
          "\"comptes\"='$comptes',\"intitule\"='$intitule',"
          "\"montant\"='$montant',\"typeJournal\"='$typeJournal',"
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
      approbationDG: data[0][6],
        signatureDG: data[0][7],
        signatureJustificationDG: data[0][8],
        approbationFin: data[0][9],
        signatureFin: data[0][10],
        signatureJustificationFin: data[0][11],
        approbationBudget: data[0][12],
        signatureBudget: data[0][13],
        signatureJustificationBudget: data[0][14],
        approbationDD: data[0][15],
        signatureDD: data[0][16],
        signatureJustificationDD: data[0][17],
        signature: data[0][18],
        created: data[0][19]
        
    );
  } 
}