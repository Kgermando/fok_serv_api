import 'package:postgres/postgres.dart';

import '../../models/taches/rapport_model.dart';
 

class RapportRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  RapportRepository(this.executor, this.tableName);

  Future<List<RapportModel>> getAllData() async {
    var data = <RapportModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(RapportModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(RapportModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom, numero_tache,"
          "rapport, signature, created, reference)"
          "VALUES (nextval('rapports_id_seq'), @1, @2, @3, @4, @5, @6)",
          substitutionValues: {
            '1': data.nom,
            '2': data.numeroTache,
            '3': data.rapport,
            '4': data.signature,
            '5': data.created,
            '6': data.reference
          });
    });
  }

  Future<void> update(RapportModel data) async {
    await executor.query("""UPDATE $tableName
        SET nom = @1, numero_tache = @2, rapport = @3,
        signature = @4, created = @5, reference = @6 WHERE id = @7""", substitutionValues: {
      '1': data.nom,
      '2': data.numeroTache,
      '3': data.rapport,
      '4': data.signature,
      '5': data.created,
      '6': data.reference,
      '7': data.id
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

  Future<RapportModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return RapportModel(
      id: data[0][0],
      nom: data[0][1],
      numeroTache: data[0][2],
      rapport: data[0][3],
      signature: data[0][4],
      created: data[0][5],
      reference: data[0][6]
    );
  }
}