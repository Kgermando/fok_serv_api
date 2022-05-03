import 'package:postgres/postgres.dart';

import '../../models/rh/perfomence_model.dart';

class PerformenceNoteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PerformenceNoteRepository(this.executor, this.tableName);

  Future<List<PerformenceNoteModel>> getAllData() async {
    var data = <PerformenceNoteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PerformenceNoteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PerformenceNoteModel performenceModel) async {
    var agent = performenceModel.agent;
    var departement = performenceModel.departement;
    var hospitalite = performenceModel.hospitalite;
    var ponctualite = performenceModel.ponctualite;
    var travaille = performenceModel.travaille;
    var note = performenceModel.note;
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('performences_note_id_seq'), '$agent',"
          "'$departement','$hospitalite', '$ponctualite','$travaille',"
          "'$note', '$signature','$created');");
    });
  }

  Future<void> update(PerformenceNoteModel performenceModel) async {
    var id = performenceModel.id;
    var agent = performenceModel.agent;
    var departement = performenceModel.departement;
    var hospitalite = performenceModel.hospitalite;
    var ponctualite = performenceModel.ponctualite;
    var travaille = performenceModel.travaille;
    var note = performenceModel.note;
    var signature = performenceModel.signature;
    var created = performenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"agent\"='$agent', \"hospitalite\"='$hospitalite',"
        "\"departement\"='$departement', \"ponctualite\"='$ponctualite', \"travaille\"='$travaille',"
        "\"note\"='$note', \"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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

  Future<PerformenceNoteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PerformenceNoteModel(
      id: data[0][0],
      agent: data[0][1],
      departement: data[0][2],
      hospitalite: data[0][3],
      ponctualite: data[0][4],
      travaille: data[0][5],
      note: data[0][6],
      signature: data[0][7],
      created: data[0][8]
    );
  }
}