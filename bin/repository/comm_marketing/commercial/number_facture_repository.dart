import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/number_facture.dart';

class NumberFactureRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  NumberFactureRepository(this.executor, this.tableName);


  Future<List<NumberFactureModel>> getAllData() async {
    var data = <NumberFactureModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(NumberFactureModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(NumberFactureModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, number, succursale, signature, created)"
        "VALUES (nextval('number_factures_id_seq'), @1, @2, @3, @4)",
        substitutionValues: {
          '1': data.number,
          '2': data.succursale,
          '3': data.signature,
          '4': data.created
        });
    });
  }

  Future<void> update(NumberFactureModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET number = @1, succursale = @2,"
          "signature = @3, created = @4 WHERE id = @5",
          substitutionValues: {
            '1': data.number,
            '2': data.succursale,
            '3': data.signature,
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

  Future<NumberFactureModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return NumberFactureModel(
      id: data[0][0],
      number: data[0][1],
      succursale: data[0][2],
      signature: data[0][3],
      created: data[0][4]
    );
  } 
}