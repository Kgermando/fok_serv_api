
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
        "INSERT INTO $tableName (id, arrive, arrive_agent, sortie, sortie_agent,"
        "remarque, fin_journee, signature, created)"
        "VALUES (nextval('presences_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
          substitutionValues: {
            '1': data.arrive,
            '2': data.arriveAgent,
            '3': data.sortie,
            '4': data.sortieAgent,
            '5': data.remarque,
            '6': data.finJournee,
            '7': data.signature,
            '8': data.created
          });
    });
  }

  Future<void> update(PresenceModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET arrive = @1, arrive_agent = @2, sortie = @3, sortie_agent = @4,"
          "remarque = @5, fin_journee = @6,"
          "signature = @7, created = @8 WHERE id = @9",
          substitutionValues: {
            '1': data.arrive,
            '2': data.arriveAgent,
            '3': data.sortie,
            '4': data.sortieAgent,
            '5': data.remarque,
            '6': data.finJournee,
            '7': data.signature,
            '8': data.created,
            '9': data.id
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