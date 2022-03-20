import 'package:postgres/postgres.dart';

import '../../models/comptabilites/amortissement_model.dart';

class AmortissementRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AmortissementRepository(this.executor, this.tableName);

  Future<List<AmortissementModel>> getAllData() async {
    var data = <AmortissementModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AmortissementModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AmortissementModel amortissementModel) async {
    var titleArmotissement = amortissementModel.titleArmotissement;
    var comptes = amortissementModel.comptes;
    var intitule = amortissementModel.intitule;
    var montant = amortissementModel.montant;
    var typeJournal = amortissementModel.typeJournal;
    var created = amortissementModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('amortissements_id_seq'), '$titleArmotissement',"
        "'$comptes','$intitule','$montant','$typeJournal','$created');");
    });
  }

  Future<void> update(AmortissementModel amortissementModel) async {
    var id = amortissementModel.id;
    var titleArmotissement = amortissementModel.titleArmotissement;
    var comptes = amortissementModel.comptes;
    var intitule = amortissementModel.intitule;
    var montant = amortissementModel.montant;
    var typeJournal = amortissementModel.typeJournal;
    var created = amortissementModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"titleArmotissement\"='$titleArmotissement', "
          "\"comptes\"='$comptes',\"intitule\"='$intitule',"
          "\"montant\"='$montant',\"typeJournal\"='$typeJournal',"
          "\"created\"='$created' WHERE id=$id;");
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

  Future<AmortissementModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AmortissementModel(
        id: data[0][0],
        titleArmotissement: data[0][1],
        comptes: data[0][2],
        intitule: data[0][3],
        montant: data[0][4],
        typeJournal: data[0][5],
        created: data[0][6]);
  } 
  
}