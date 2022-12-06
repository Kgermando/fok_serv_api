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
          "INSERT INTO $tableName (id, title_bilan,"
          "signature, created, is_submit,"
          "approbation_dd, motif_dd, signature_dd)"
          "VALUES (nextval('bilans_id_seq'), @1, @2, @3, @4, @5, @6, @7)",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.signature,
            '3': data.created,
            '4': data.isSubmit,
            '5': data.approbationDD,
            '6': data.motifDD,
            '7': data.signatureDD 
          });
    });
  }

  Future<void> update(BilanModel data) async {
    await executor.query("""UPDATE $tableName
      SET title_bilan = @1, signature = @2,
      created = @3, is_submit = @4, approbation_dd = @5, motif_dd = @6, signature_dd = @7 WHERE id = @8""", 
      substitutionValues: {
      '1': data.titleBilan,
      '2': data.signature,
      '3': data.created,
      '4': data.isSubmit,
      '5': data.approbationDD,
      '6': data.motifDD,
      '7': data.signatureDD,
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      signature: data[0][2],
      created: data[0][3],
      isSubmit: data[0][4],
      approbationDD: data[0][5],
      motifDD: data[0][6],
      signatureDD: data[0][7] 
    );
  }
  
}