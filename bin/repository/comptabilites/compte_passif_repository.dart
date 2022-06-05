import 'package:postgres/postgres.dart';

import '../../models/comptabilites/compte_passif_model.dart';


class ComptePassifRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  ComptePassifRepository(this.executor, this.tableName);

  Future<List<ComptePassifModel>> getAllData() async {
    var data = <ComptePassifModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"reference\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(ComptePassifModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(ComptePassifModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, comptes, montant)"
          "VALUES (nextval('compte_passifs_id_seq'), @1, @2, @3)",
          substitutionValues: {
            '1': data.reference,
            '2': data.comptes,
            '3': data.montant
          });
    });
  }

  Future<void> update(ComptePassifModel data) async {
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

  Future<ComptePassifModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return ComptePassifModel(
      id: data[0][0],
      reference: data[0][1],
      comptes: data[0][2],
      montant: data[0][3]
    );
  }
  
}