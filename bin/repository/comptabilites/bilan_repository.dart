import 'package:postgres/postgres.dart';

import '../../models/comptabilites/bilan_model.dart';

class BilanRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BilanRepository(this.executor, this.tableName);

  Future<List<BilanModel>> getAllData() async {
    var data = <BilanModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BilanModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BilanModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, title_bilan,"
          "signature, created_ref , created)"
          "VALUES (nextval('bilans_id_seq'), @1, @2, @3, @4)",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.signature,
            '3': data.createdRef,
            '4': data.created
          });
    });
  }

  Future<void> update(BilanModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          """UPDATE $tableName
          SET title_bilan = @1, signature = @2,
          created_ref = @3, created = @4 WHERE id = @5""",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.signature,
            '3': data.createdRef,
            '4': data.created,
            '5': data.id
          });
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      signature: data[0][2],
      createdRef: data[0][3],
      created: data[0][4]
    );
  }
  
}