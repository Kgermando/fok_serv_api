
import 'package:postgres/postgres.dart';

import '../../models/rh/presence_personnel_model.dart';
 

class PresencePersonnelRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PresencePersonnelRepository(this.executor, this.tableName);

  Future<List<PresencePersonnelModel>> getAllData() async {
    var data = <PresencePersonnelModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PresencePersonnelModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PresencePersonnelModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
      "INSERT INTO $tableName (id, reference, identifiant, motif, sortie,"
      "signature, signature_fermeture, created, created_sortie)"
      "VALUES (nextval('presence_personnels_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)",
        substitutionValues: {
          '1': data.reference,
          '2': data.identifiant,
          '3': data.motif,
          '4': data.sortie,
          '5': data.signature,
          '6': data.signatureFermeture,
          '7': data.created,
          '8': data.createdSortie
        });
    });
  }

  Future<void> update(PresencePersonnelModel data) async {
    await executor.query("""UPDATE $tableName
          SET reference = @1, identifiant = @2, motif = @3, sortie = @4,
          signature = @5, signature_fermeture = @6, created = @7, created_sortie = @8 WHERE id = @9""",
        substitutionValues: {
          '1': data.reference,
          '2': data.identifiant,
          '3': data.motif,
          '4': data.sortie,
          '5': data.signature,
          '6': data.signatureFermeture,
          '7': data.created,
          '8': data.createdSortie,
          '9': data.id
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

  Future<PresencePersonnelModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresencePersonnelModel(
      id: data[0][0],
      reference: data[0][1],
      identifiant: data[0][2],
      motif: data[0][3],
      sortie: data[0][4],
      signature: data[0][5],
      signatureFermeture: data[0][6],
      created: data[0][7],
      createdSortie: data[0][8]
    );
  }
}