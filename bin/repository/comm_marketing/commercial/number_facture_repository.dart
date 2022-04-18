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

  Future<void> insertData(NumberFactureModel factureCartModel) async {

    var number = factureCartModel.number;
    var succursale = factureCartModel.succursale;
    var nameBusiness = factureCartModel.nameBusiness;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('number_factures_id_seq'), '$number',"
        "'$succursale', '$nameBusiness');");
    });
  }

  Future<void> update(NumberFactureModel factureCartModel) async {
    var id = factureCartModel.id;
    var number = factureCartModel.number;
    var succursale = factureCartModel.succursale;
    var nameBusiness = factureCartModel.nameBusiness;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"number\"='$number',"
        "\"succursale\"='$succursale',\"nameBusiness\"='$nameBusiness' WHERE id=$id;");
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
      nameBusiness: data[0][3]
    );
  } 
}