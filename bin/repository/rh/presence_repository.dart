
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

  Future<void> insertData(PresenceModel presenceModel) async {
    var arrive = presenceModel.arrive;
    var arriveAgent = presenceModel.arriveAgent;
    var sortie = presenceModel.sortie;
    var sortieAgent = presenceModel.sortieAgent;
    var remarque = presenceModel.remarque;
    var finJournee = presenceModel.finJournee;
    var signature = presenceModel.signature;
    var created = presenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('presences_id_seq'), '$arrive',"
          "'$arriveAgent','$sortie','$sortieAgent', '$remarque',"
          "'$finJournee', '$signature', '$created');");
    });
  }

  Future<void> update(PresenceModel presenceModel) async {
    var id = presenceModel.id;
    var arrive = presenceModel.arrive;
    var arriveAgent = presenceModel.arriveAgent;
    var sortie = presenceModel.sortie;
    var sortieAgent = presenceModel.sortieAgent;
    var remarque = presenceModel.remarque;
    var finJournee = presenceModel.finJournee;
    var signature = presenceModel.signature;
    var created = presenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"arrive\"='$arrive',"
        "\"arriveAgent\"='$arriveAgent', \"sortie\"='$sortie',"
        "\"sortieAgent\"='$sortieAgent', \"remarque\"='$remarque', \"finJournee\"='$finJournee',"
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

  Future<PresenceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceModel(
      id: data[0][0],
      arrive: data[0][1],
      arriveAgent: data[0][2],
      sortie: data[0][3],
      sortieAgent: data[0][4],
      remarque: data[0][5],
      finJournee: data[0][6],
      signature: data[0][7],
      created: data[0][8]
    );
  }
}