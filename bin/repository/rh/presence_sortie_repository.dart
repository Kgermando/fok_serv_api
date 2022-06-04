
import 'package:postgres/postgres.dart';

import '../../models/rh/presence_sortie_model.dart';

class PresenceSortieRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  PresenceSortieRepository(this.executor, this.tableName);

  Future<List<PresenceSortieModel>> getAllData() async {
    var data = <PresenceSortieModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(PresenceSortieModel.fromSQL(row));
    }
    return data.toList();
  }

    Future<void> insertData(PresenceSortieModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, nom, prenom, matricule, note,"
          "signature, created)"
          "VALUES (nextval('presences_entrer_id_seq'), @1, @2, @3, @4, @5, @6 , @7, @8)",
          substitutionValues: {
            '1': data.reference,
            '2': data.nom,
            '3': data.prenom,
            '4': data.prenom,
            '5': data.matricule,
            '6': data.note,
            '7': data.signature,
            '8': data.created
          });
    });
  }

  Future<void> update(PresenceSortieModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET reference = @1, nom = @2, prenom = @3, matricule = @4,"
          "note = @5, signature = @6, created = @7 WHERE id = @9",
          substitutionValues: {
            '1': data.reference,
            '2': data.nom,
            '3': data.prenom,
            '4': data.prenom,
            '5': data.matricule,
            '6': data.note,
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

  Future<PresenceSortieModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return PresenceSortieModel(
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