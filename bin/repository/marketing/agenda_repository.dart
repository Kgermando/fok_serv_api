import 'package:postgres/postgres.dart';
 
import '../../models/marketing/agenda_model.dart';

class AgendaRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgendaRepository(this.executor, this.tableName);

  Future<List<AgendaModel>> getAllData(String business) async {
    var data = <AgendaModel>{};

    var querySQL = "SELECT * FROM $tableName WHERE \"business\"='$business' ORDER BY \"created\" DESC;";
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
          "date_rappel, signature, created, business, sync, async)"
          "VALUES (nextval('agendas_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
          substitutionValues: {
            '1': data.title,
            '2': data.description,
            '3': data.dateRappel,
            '4': data.signature,
            '5': data.created,
            '6': data.business,
            '7': data.sync,
            '8': data.async
          });
    });
  }

  Future<void> update(AgendaModel data) async {
    await executor.query("""UPDATE $tableName
      SET title = @1, description = @2, date_rappel = @3,
      signature = @4, created = @5, created = @6,
    sync = @7, async = @8 WHERE id = @9""", substitutionValues: {
      '1': data.title,
      '2': data.description,
      '3': data.dateRappel,
      '4': data.signature,
      '5': data.created,
      '6': data.business,
      '7': data.sync,
      '8': data.async,
      '9': data.id
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
        created: data[0][5],
        business: data[0][6],
      sync: data[0][7],
    async: data[0][8],
    );
  }
}
