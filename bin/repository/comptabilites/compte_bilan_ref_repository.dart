import 'package:postgres/postgres.dart';

import '../../models/comptabilites/compte_bilan_ref_model.dart';


class CompteBilanRefRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CompteBilanRefRepository(this.executor, this.tableName);

  Future<List<CompteBilanRefModel>> getAllData() async {
    var data = <CompteBilanRefModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"reference\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CompteBilanRefModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CompteBilanRefModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, reference, comptes, montant, type)"
          "VALUES (nextval('compte_bilan_ref_id_seq'), @1, @2, @3, @4)",
          substitutionValues: {
            '1': data.reference,
            '2': data.comptes,
            '3': data.montant,
            '4': data.type,
          });
    });
  }

  Future<void> update(CompteBilanRefModel data) async {
    await executor.query("""UPDATE $tableName
      SET reference = @1, 
      comptes = @2, montant = @3, 
      type = @4 WHERE id = @5""", substitutionValues: {
      '1': data.reference,
      '2': data.comptes,
      '3': data.montant,
      '4': data.type,
      '5': data.id
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

  Future<CompteBilanRefModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CompteBilanRefModel(
      id: data[0][0],
      reference: data[0][1],
      comptes: data[0][2],
      montant: data[0][3],
      type: data[0][4]
    );
  }
  
}