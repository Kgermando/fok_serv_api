import 'package:postgres/postgres.dart';

import '../../models/rh/perfomence_model.dart';

class PerformenceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PerformenceRepository(this.executor, this.tableName);

  Future<List<PerformenceModel>> getAllData() async {
    var data = <PerformenceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PerformenceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PerformenceModel performenceModel) async {
    var agent = performenceModel.agent;
    var departement = performenceModel.departement;
    var hospitalite = performenceModel.hospitalite;
    var ponctualite = performenceModel.ponctualite;
    var travaille = performenceModel.travaille;

    var approbationDG = performenceModel.approbationDG;
    var signatureDG = performenceModel.signatureDG;
    var signatureJustificationDG = performenceModel.signatureJustificationDG;

    var approbationFin = performenceModel.approbationFin;
    var signatureFin = performenceModel.signatureFin;
    var signatureJustificationFin = performenceModel.signatureJustificationFin;

    var approbationBudget = performenceModel.approbationBudget;
    var signatureBudget = performenceModel.signatureBudget;
    var signatureJustificationBudget =performenceModel.signatureJustificationBudget;

    var approbationDD = performenceModel.approbationDD;
    var signatureDD = performenceModel.signatureDD;
    var signatureJustificationDD = performenceModel.signatureJustificationDD;
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('performences_id_seq'), '$agent',"
          "'$departement','$hospitalite', '$ponctualite','$travaille',"
          "'$approbationDG','$signatureDG','$signatureJustificationDG',"
          "'$approbationFin','$signatureFin','$signatureJustificationFin',"
          "'$approbationBudget','$signatureBudget','$signatureJustificationBudget',"
          "'$approbationDD','$signatureDD','$signatureJustificationDD',"
          "'$signature','$created');");
    });
  }

  Future<void> update(PerformenceModel performenceModel) async {
    var id = performenceModel.id;
    var agent = performenceModel.agent;
    var departement = performenceModel.departement;
    var hospitalite = performenceModel.hospitalite;
    var ponctualite = performenceModel.ponctualite;
    var travaille = performenceModel.travaille;
    var approbationDG = performenceModel.approbationDG;
    var signatureDG = performenceModel.signatureDG;
    var signatureJustificationDG = performenceModel.signatureJustificationDG;

    var approbationFin = performenceModel.approbationFin;
    var signatureFin = performenceModel.signatureFin;
    var signatureJustificationFin = performenceModel.signatureJustificationFin;

    var approbationBudget = performenceModel.approbationBudget;
    var signatureBudget = performenceModel.signatureBudget;
    var signatureJustificationBudget =
        performenceModel.signatureJustificationBudget;

    var approbationDD = performenceModel.approbationDD;
    var signatureDD = performenceModel.signatureDD;
    var signatureJustificationDD = performenceModel.signatureJustificationDD;
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"agent\"='$agent', \"hospitalite\"='$hospitalite',"
        "\"departement\"='$departement', \"ponctualite\"='$ponctualite', \"travaille\"='$travaille',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG', \"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin', \"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget', \"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD', \"signatureJustificationDD\"='$signatureJustificationDD',"
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

  Future<PerformenceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PerformenceModel(
      id: data[0][0],
      agent: data[0][1],
      departement: data[0][2],
      hospitalite: data[0][3],
      ponctualite: data[0][4],
      travaille: data[0][5],
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