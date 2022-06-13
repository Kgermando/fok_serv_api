import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/succursale_model.dart';

class SuccursaleRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  SuccursaleRepository(this.executor, this.tableName);

  Future<List<SuccursaleModel>> getAllData() async {
    var data = <SuccursaleModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(SuccursaleModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(SuccursaleModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, name, adresse,"
        "province, signature, created)"
        "VALUES (nextval('succursales_id_seq'), @1, @2, @3, @4, @5)",
        substitutionValues: {
          '1': data.name,
          '2': data.adresse,
          '3': data.province,
          '4': data.signature,
          '5': data.created
        });
    });
  }

  Future<void> update(SuccursaleModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          """UPDATE $tableName"
          SET name = @1, adresse = @2, province = @3,
          signature = @4, created = @5 WHERE id = @6""",
          substitutionValues: {
            '1': data.name,
            '2': data.adresse,
            '3': data.province,
            '4': data.signature,
            '5': data.created,
            '6': data.id
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

  Future<SuccursaleModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return SuccursaleModel(
      id: data[0][0],
      name: data[0][1],
      adresse: data[0][2],
      province: data[0][3],
      signature: data[0][4],
      created: data[0][5]
    );
  } 
}