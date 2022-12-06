import 'package:postgres/postgres.dart';

import '../../models/maketing/agenda_model.dart';

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
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, title, description,"
          "date_rappel, signature, created)"
          "VALUES (nextval('agendas_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.title,
            '2': data.description,
            '3': data.dateRappel,
            '4': data.signature,
            '5': data.created
          });
    });
  }

  Future<void> update(AgendaModel data) async {
    await executor.query("""UPDATE $tableName
      SET title = @1, description = @2, date_rappel = @3,
      signature = @4, created = @5 WHERE id = @6""", substitutionValues: {
      '1': data.title,
      '2': data.description,
      '3': data.dateRappel,
      '4': data.signature,
      '5': data.created,
      '6': data.id
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
