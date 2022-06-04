
import 'package:postgres/postgres.dart';

import '../../models/rh/presence_entrer_model.dart';

class PresenceEntrerRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PresenceEntrerRepository(this.executor, this.tableName);

  Future<List<PresenceEntrerModel>> getAllData() async {
    var data = <PresenceEntrerModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PresenceEntrerModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PresenceEntrerModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom, postnom, prenom, remarque,"
        "signature, created)"
        "VALUES (nextval('presences_entrer_id_seq'), @1, @2, @3, @4, @5, @6)",
          substitutionValues: {
            '1': data.nom,
            '2': data.postnom,
            '3': data.prenom,
            '4': data.remarque,
            '5': data.signature,
            '6': data.created
          });
    });
  }

  Future<void> update(PresenceEntrerModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET arrive = @1, arrive_agent = @2, sortie = @3, sortie_agent = @4,"
          "remarque = @5, fin_journee = @6,"
          "signature = @7, created = @8 WHERE id = @7",
          substitutionValues: {
            '1': data.nom,
            '2': data.postnom,
            '3': data.prenom,
            '4': data.remarque,
            '5': data.signature,
            '6': data.created,
            '7': data.id
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

  Future<PresenceEntrerModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceEntrerModel(
      id: data[0][0],
      nom: data[0][1],
      postnom: data[0][2],
      prenom: data[0][3],
      remarque: data[0][4],
      signature: data[0][5],
      created: data[0][6]
    );
  }
}