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
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin =
        data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;


    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('approbations_id_seq'), '$reference',"
        "'$title','$departement', '$ligneBudgtaire', '$resources',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
        "'$signature','$created');");
    });
  }

  Future<void> update(ApprobationModel data) async {
    var id = data.id;
    var reference = data.reference;
    var title = data.title;
    var departement = data.departement;
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG = data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget = data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD = data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"reference\"='$reference',"
          "\"title\"='$title',\"departement\"='$departement',"
          "\"ligneBudgtaire\"='$ligneBudgtaire', \"resources\"='$resources',"
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

  Future<ApprobationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ApprobationModel(
      id: data[0][0],
      reference: data[0][1],
      title: data[0][2],
      departement: data[0][3],
      ligneBudgtaire: data[0][3],
      resources: data[0][4],
      approbationDG: data[0][5],
      signatureDG: data[0][6],
      signatureJustificationDG: data[0][7],
      approbationFin: data[0][8],
      signatureFin: data[0][9],
      signatureJustificationFin: data[0][10],
      approbationBudget: data[0][11],
      signatureBudget: data[0][12],
      signatureJustificationBudget: data[0][13],
      approbationDD: data[0][14],
      signatureDD: data[0][15],
      signatureJustificationDD: data[0][16],
      signature: data[0][17],
      created: data[0][18]
    );
  } 
}