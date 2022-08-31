
import 'package:postgres/postgres.dart';

import '../../models/rh/presence_model.dart';

class PresenceRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PresenceRepository(this.executor, this.tableName);

  Future<List<PresenceModel>> getAllData() async {
    var data = <PresenceModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PresenceModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PresenceModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, title, signature, created)"
        "VALUES (nextval('presences_id_seq'), @1, @2, @3)",
          substitutionValues: {
            '1': data.title,
            '2': data.signature,
            '3': data.created
          });
    });
  }

  Future<void> update(PresenceModel data) async {
    await executor.query("""UPDATE $tableName
      SET title = @1, signature = @2, created = @3 WHERE id = @4""",
        substitutionValues: {
          '1': data.title,
          '2': data.signature,
          '3': data.created,
          '4': data.id
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

  Future<PresenceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceModel(
      id: data[0][0],
      title: data[0][1],
      signature: data[0][2],
      created: data[0][3]
    );
  }
}