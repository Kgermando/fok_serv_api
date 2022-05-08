import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/gain_model.dart';

class GainRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  GainRepository(this.executor, this.tableName);


  Future<List<GainModel>> getAllData() async {
    var data = <GainModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(GainModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(GainModel gainModel) async {
    var sum = gainModel.sum;
    var succursale = gainModel.succursale;
    var signature = gainModel.signature;
    var created = gainModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('gains_id_seq'), '$sum',"
        "'$succursale', '$signature','$created');");
    });
  }

  Future<void> update(GainModel gainModel) async {
    var id = gainModel.id;
    var sum = gainModel.sum;
    var succursale = gainModel.succursale;
    var signature = gainModel.signature;
    var created = gainModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"sum\"='$sum',"
        "\"succursale\"='$succursale',"
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

  Future<GainModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return GainModel(
      id: data[0][0],
      sum: data[0][1],
        signature: data[0][2],
        succursale: data[0][3],
        created: data[0][4]
    );
  } 
}