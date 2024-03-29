import 'package:postgres/postgres.dart';

import '../../models/taches/tache_model.dart';

class TacheRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TacheRepository(this.executor, this.tableName);

  Future<List<TacheModel>> getAllData() async {
    var data = <TacheModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TacheModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TacheModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, nom, numero_tache,"
        "agent, jalon, tache, signature_resp, created, read, departement, reference)"
        "VALUES (nextval('taches_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)",
        substitutionValues: {
          '1': data.nom,
          '2': data.numeroTache,
          '3': data.agent,
          '4': data.jalon,
          '5': data.tache,
          '6': data.signatureResp,
          '7': data.created,
          '8': data.read,
          '9': data.departement,
          '10': data.reference
        });
    });
  }

  Future<void> update(TacheModel data) async {
    await executor.query("""UPDATE $tableName
        SET nom = @1, numero_tache = @2, agent = @3,
        jalon = @4, tache = @5, signature_resp = @6, created = @7,
        read = @8, departement = @9, reference = @10 WHERE id = @11""", substitutionValues: {
      '1': data.nom,
      '2': data.numeroTache,
      '3': data.agent,
      '4': data.jalon,
      '5': data.tache,
      '6': data.signatureResp,
      '7': data.created,
      '8': data.read,
      '9': data.departement,
      '10': data.reference,
      '11': data.id
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

  Future<TacheModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TacheModel(
      id: data[0][0],
      nom: data[0][1],
      numeroTache: data[0][2],
      agent: data[0][3],
      jalon: data[0][4],
      tache: data[0][5],
      signatureResp: data[0][6],
      created: data[0][7],
      read: data[0][8],
      departement: data[0][9],
      reference: data[0][10],
    );
  }
}