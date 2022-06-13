import 'package:postgres/postgres.dart';

import '../../models/rh/perfomence_model.dart';

class PerformenceNoteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PerformenceNoteRepository(this.executor, this.tableName);

  Future<List<PerformenceNoteModel>> getAllData() async {
    var data = <PerformenceNoteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PerformenceNoteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(PerformenceNoteModel performenceModel) async {
    await executor.transaction((ctx) async {
      await ctx.query("INSERT INTO $tableName (id, agent, departement, hospitalite,"
      "ponctualite, travaille, note, signature, created)"
      "VALUES (nextval('performences_note_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8)", 
        substitutionValues: {
          '1': performenceModel.agent,
          '2': performenceModel.departement,
          '3': performenceModel.hospitalite,
          '4': performenceModel.ponctualite,
          '5': performenceModel.travaille,
          '6': performenceModel.note,
          '7': performenceModel.signature,
          '8': performenceModel.created
        });
    });
  }

  Future<void> update(PerformenceNoteModel performenceModel) async {
    await executor.query("""UPDATE $tableName SET agent = @1, hospitalite = @2,
          departement = @3, ponctualite = @4, travaille = @5,
          note = @6, signature = @7, created = @8 WHERE id=@9""",
        substitutionValues: {
          '1': performenceModel.agent,
          '2': performenceModel.departement,
          '3': performenceModel.hospitalite,
          '4': performenceModel.ponctualite,
          '5': performenceModel.travaille,
          '6': performenceModel.note,
          '7': performenceModel.signature,
          '8': performenceModel.created,
          '9': performenceModel.id
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

  Future<PerformenceNoteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PerformenceNoteModel(
        id: data[0][0],
        agent: data[0][1],
        departement: data[0][2],
        hospitalite: data[0][3],
        ponctualite: data[0][4],
        travaille: data[0][5],
        note: data[0][6],
        signature: data[0][7],
        created: data[0][8]);
  }
}
