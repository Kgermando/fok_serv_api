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
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('performences_id_seq'), '$agent',"
          "'$departement','$hospitalite', '$ponctualite','$travaille'," 
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
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"agent\"='$agent', \"hospitalite\"='$hospitalite',"
        "\"departement\"='$departement', \"ponctualite\"='$ponctualite', \"travaille\"='$travaille',"
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
      signature: data[0][6],
      created: data[0][7]
    );
  }
}