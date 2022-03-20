
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
    var matricule = presenceModel.matricule;
    var arrive = presenceModel.arrive;
    var sortie = presenceModel.sortie;
    var presence = presenceModel.presence;
    var motif = presenceModel.motif;
    var created = presenceModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('presences_id_seq'), '$matricule',"
          "'$arrive','$sortie','$presence', '$motif', '$created');");
    });
  }

  Future<void> update(PresenceModel presenceModel) async {
    var id = presenceModel.id;
    var matricule = presenceModel.matricule;
    var arrive = presenceModel.arrive;
    var sortie = presenceModel.sortie;
    var presence = presenceModel.presence;
    var motif = presenceModel.motif;
    var created = presenceModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"matricule\"='$matricule', \"arrive\"='$arrive',"
        "\"sortie\"='$sortie',\"presence\"='$presence', \"motif\"='$motif',"
        "\"created\"='$created' WHERE id=$id;");
    });
    // await ConnexionDatabase().closeConnection(executor);
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
      matricule: data[0][1],
      arrive: data[0][2],
      sortie: data[0][3],
      presence: data[0][4],
      motif: data[0][5],
      created: data[0][6]
    );
  }
}