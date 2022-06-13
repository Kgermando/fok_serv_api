
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
      "INSERT INTO $tableName (id, reference, nom, prenom, matricule, note,"
      "signature, created)"
      "VALUES (nextval('presences_entrer_id_seq'), @1, @2, @3, @4, @5, @6 , @7)",
        substitutionValues: {
          '1': data.reference,
          '2': data.nom,
          '3': data.prenom,
          '4': data.matricule,
          '5': data.note,
          '6': data.signature,
          '7': data.created,
        });
    });
  }

  Future<void> update(PresenceEntrerModel data) async {
    await executor.query("""UPDATE $tableName
          SET reference = @1, nom = @2, prenom = @3, matricule = @4,
          note = @5, signature = @6, created = @7 WHERE id = @8""",
        substitutionValues: {
          '1': data.reference,
          '2': data.nom,
          '3': data.prenom,
          '4': data.matricule,
          '5': data.note,
          '6': data.signature,
          '7': data.created,
          '8': data.id
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
      reference: data[0][1],
      nom: data[0][2],
      prenom: data[0][3],
      matricule: data[0][4],
      note: data[0][5],
      signature: data[0][6],
      created: data[0][7]
    );
  }
}