
import 'package:postgres/postgres.dart';

import '../../models/rh/salaire_model.dart';

class SalaireRpository {
  final PostgreSQLConnection executor;
  final String tableName;

  SalaireRpository(this.executor, this.tableName);


  Future<List<SalaireModel>> getAllData() async {
    var data = <SalaireModel>{};
    
    var querySQL = "SELECT * FROM $tableName ORDER BY \"date\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(SalaireModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(SalaireModel salaireModel) async {
    // var id = salaireModel.id;
    var matricule = salaireModel.matricule;
    var salaire = salaireModel.salaire;
    var date = salaireModel.date;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('salaires_id_seq'), '$matricule', '$salaire', '$date');");
    });
  }

  Future<void> update(SalaireModel salaireModel) async {
    var id = salaireModel.id;
    var matricule = salaireModel.matricule;
    var salaire = salaireModel.salaire;
    var date = salaireModel.date;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"matricule\"='$matricule', \"salaire\"='$salaire', \"date\"='$date' WHERE id=$id;");
    });
    // await ConnexionDatabase().closeConnection(executor);
  }


  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      });
    } catch(e) {
      'erreur $e';
    }
  }

  Future<SalaireModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return SalaireModel(
      id: data[0][0],
      matricule: data[0][1],
      salaire: data[0][2],
      date: data[0][3]
    );
  }

}