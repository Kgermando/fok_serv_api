import 'package:postgres/postgres.dart';

import '../../models/update/update_model.dart';

class UpdateVersionRepository {
   final PostgreSQLConnection executor;
  final String tableName;

  UpdateVersionRepository(this.executor, this.tableName);


  Future<List<UpdateModel>> getAllData() async {
    var data = <UpdateModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(UpdateModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(UpdateModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
        "INSERT INTO $tableName (id, version, url_update, created)"
        "VALUES (nextval('update-verions_id_seq'), @1, @2, @3)",
        substitutionValues: {
          '1': data.version,
          '2': data.urlUpdate,
          '3': data.created
        });
    });
  }

  Future<void> update(UpdateModel data) async {
    await executor.query("""UPDATE $tableName
      SET version = @1, url_update = @2,
        created = @3 WHERE id = @4""", substitutionValues: {
      '1': data.version,
      '2': data.urlUpdate,
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

  Future<UpdateModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return UpdateModel(
      id: data[0][0],
      version: data[0][1],
      urlUpdate: data[0][2],
      created: data[0][3]
    );
  } 
}
