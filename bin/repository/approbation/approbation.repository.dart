import 'package:postgres/postgres.dart';

import '../../models/approbation/approbation_model.dart';

class ApprobationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ApprobationRepository(this.executor, this.tableName);


  Future<List<ApprobationModel>> getAllData() async {
    var data = <ApprobationModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ApprobationModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ApprobationModel data) async {
    
   var reference = data.reference;
    var title = data.title;
    var departement = data.departement;
    var fontctionOccupee = data.fontctionOccupee;
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;

    var approbation = data.approbation;
    var signatureApprobation = data.signatureApprobation;
    var justification = data.justification;

    var signature = data.signature;
    var created = data.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('approbations_id_seq'), '$reference',"
        "'$title', '$departement', '$fontctionOccupee', '$ligneBudgtaire', '$resources',"
        "'$approbation', '$signatureApprobation', '$justification',"
        "'$signature', '$created');");
    });
  }

  Future<void> update(ApprobationModel data) async {
    var id = data.id;
    var reference = data.reference;
    var title = data.title;
    var departement = data.departement;
    var fontctionOccupee = data.fontctionOccupee;
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;

    var approbation = data.approbation;
    var signatureApprobation = data.signatureApprobation;
    var justification = data.justification;

    var signature = data.signature;
    var created = data.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"reference\"='$reference',"
          "\"title\"='$title',\"departement\"='$departement',"
          "\"fontctionOccupee\"='$fontctionOccupee',"
          "\"ligneBudgtaire\"='$ligneBudgtaire', \"resources\"='$resources',"
          "\"approbation\"='$approbation', \"signatureApprobation\"='$signatureApprobation',"
          "\"justification\"='$justification',"
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

  Future<ApprobationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ApprobationModel(
      id: data[0][0],
      reference: data[0][1],
      title: data[0][2],
      departement: data[0][3],
      fontctionOccupee: data[0][4],
      ligneBudgtaire: data[0][5],
      resources: data[0][6],
      approbation: data[0][7],
      signatureApprobation: data[0][8],
      justification: data[0][9],
      signature: data[0][10],
      created: data[0][11]
    );
  } 
}