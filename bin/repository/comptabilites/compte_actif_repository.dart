import 'package:postgres/postgres.dart';

import '../../models/comptabilites/compte_actif_model.dart';


class CompteActifRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CompteActifRepository(this.executor, this.tableName);

  Future<List<CompteActifModel>> getAllData() async {
    var data = <CompteActifModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"reference\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CompteActifModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CompteActifModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, comptes, montant)"
          "VALUES (nextval('compte_actifs_id_seq'), @1, @2, @3)",
          substitutionValues: {
            '1': data.reference,
            '2': data.comptes,
            '3': data.montant
          });
    });
  }

  Future<void> update(CompteActifModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET reference = @1,"
          "comptes = @2, montant = @3 WHERE id = @4",
          substitutionValues: {
            '1': data.reference,
            '2': data.comptes,
            '3': data.montant,
            '4': data.id
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

  Future<CompteActifModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CompteActifModel(
      id: data[0][0],
      reference: data[0][1],
      comptes: data[0][2],
      montant: data[0][3]
    );
  }
  
}