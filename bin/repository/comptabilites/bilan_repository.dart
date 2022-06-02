import 'package:postgres/postgres.dart';

import '../../models/comptabilites/bilan_model.dart';

class BilanRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BilanRepository(this.executor, this.tableName);

  Future<List<BilanModel>> getAllData() async {
    var data = <BilanModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BilanModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BilanModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, title_bilan, comptes_actif,"
          "comptes_pactif, signature, created)"
          "VALUES (nextval('bilans_id_seq'), @1, @2, @3, @4, @5)",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.comptesActif,
            '3': data.comptesPactif,
            '4': data.signature,
            '5': data.created
          });
    });
  }

  Future<void> update(BilanModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET title_bilan = @1, comptes_actif = @2, comptes_pactif = @3,"
          "signature = @4, created = @5 WHERE id = @6",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.comptesActif,
            '3': data.comptesPactif,
            '4': data.signature,
            '5': data.created,
            '6': data.id
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      comptesActif: data[0][2],
      comptesPactif: data[0][3],
      statut: data[0][4],
      signature: data[0][5],
      created: data[0][6]   
    );
  }
  
}