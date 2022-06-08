
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
        "INSERT INTO $tableName (id, remarque, fin_journee, signature,"
        "signature_fermeture, created_ref, created)"
        "VALUES (nextval('presences_id_seq1'), @1, @2, @3, @4 , @5 , @6)",
          substitutionValues: {
            '1': data.remarque,
            '2': data.finJournee,
            '3': data.signature,
            '4': data.signatureFermeture,
            '5': data.createdRef,
            '6': data.created
          });
    });
  }

  Future<void> update(PresenceModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
      "UPDATE $tableName"
      "SET remarque = @1, fin_journee = @2, signature = @3,"
      "signature_fermeture = @4, created_ref = @5, created = @6 WHERE id = @7",
      substitutionValues: {
        '1': data.remarque,
        '2': data.finJournee,
        '3': data.signature,
        '4': data.signatureFermeture,
        '5': data.createdRef,
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

  Future<PresenceModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceModel(
      id: data[0][0],
      remarque: data[0][1],
      finJournee: data[0][2],
      signature: data[0][3],
      signatureFermeture: data[0][4],
      createdRef: data[0][5],
      created: data[0][6]
    );
  }
}