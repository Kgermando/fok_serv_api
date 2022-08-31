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
          "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
          "VALUES (nextval('bilans_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10)",
          substitutionValues: {
            '1': data.titleBilan,
            '2': data.signature,
            '3': data.created,
            '4': data.isSubmit,
            '5': data.approbationDG,
            '6': data.motifDG,
            '7': data.signatureDG,
            '8': data.approbationDD,
            '9': data.motifDD,
            '10': data.signatureDD
          });
    });
  }

  Future<void> update(BilanModel data) async {
    await executor.query("""UPDATE $tableName
      SET title_bilan = @1, signature = @2,
      created = @3, is_submit = @4, approbation_dg = @5, motif_dg = @6, signature_dg = @7,
        approbation_dd = @8, approbation_dd = @9,
        signature_dd = @10 WHERE id = @11""", 
      substitutionValues: {
      '1': data.titleBilan,
      '2': data.signature,
      '3': data.created,
      '4': data.isSubmit,
      '5': data.approbationDG,
      '6': data.motifDG,
      '7': data.signatureDG,
      '8': data.approbationDD,
      '9': data.motifDD,
      '10': data.signatureDD,
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

  Future<BilanModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BilanModel(
      id: data[0][0],
      titleBilan: data[0][1],
      signature: data[0][2],
      created: data[0][3],
      isSubmit: data[0][4],
      approbationDG: data[0][5],
      motifDG: data[0][6],
      signatureDG: data[0][7],
      approbationDD: data[0][8],
      motifDD: data[0][9],
      signatureDD: data[0][10] 
    );
  }
  
}