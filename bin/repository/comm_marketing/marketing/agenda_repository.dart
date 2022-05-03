import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/agenda_model.dart';

class AgendaRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgendaRepository(this.executor, this.tableName);

  Future<List<AgendaModel>> getAllData() async {
    var data = <AgendaModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AgendaModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AgendaModel data) async {
    var title = data.title;
    var description = data.description;
    var dateRappel = data.dateRappel;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('agendas_id_seq'), '$title',"
          "'$description','$dateRappel',"
          "'$signature','$created');");
    });
  }

  Future<void> update(AgendaModel data) async {
    var id = data.id;
    var title = data.title;
    var description = data.description;
    var dateRappel = data.dateRappel;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"title\"='$title', "
          "\"description\"='$description',\"dateRappel\"='$dateRappel',"
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

  Future<AgendaModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AgendaModel(
        id: data[0][0],
        title: data[0][1],
        description: data[0][2],
        dateRappel: data[0][3],
        signature: data[0][4],
        created: data[0][5]);
  }
}
