import 'package:postgres/postgres.dart';

import '../../models/comptabilites/balance_comptes_model.dart';

class BalanceCompteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  BalanceCompteRepository(this.executor, this.tableName);

  Future<List<BalanceCompteModel>> getAllData() async {
    var data = <BalanceCompteModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(BalanceCompteModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(BalanceCompteModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, title,"
          "statut, signature, created_ref, created, is_submit,"
          "approbation_dg, motif_dg, signature_dg, approbation_dd, motif_dd, signature_dd)"
          "VALUES (nextval('balance_comptes_id_seq'), @1, @2, @3, @4, @5, @6,"
          "@7, @8, @9, @10, @11, @12)",
          substitutionValues: {
            '1': data.title,
            '2': data.statut,
            '3': data.signature,
            '4': data.createdRef,
            '5': data.created,
            '6': data.isSubmit,
            '7': data.approbationDG,
            '8': data.motifDG,
            '9': data.signatureDG,
            '10': data.approbationDD,
            '11': data.motifDD,
            '12': data.signatureDD
          });
    });
  }

  Future<void> update(BalanceCompteModel data) async {
    await executor.query("""UPDATE $tableName
        SET title = @1, statut = @2, signature = @3, created_ref = @4,
        created = @5, is_submit = @6, approbation_dg = @7, motif_dg = @8,
        signature_dg = @9, approbation_dd = @10,
        motif_dd = @11, signature_dd = @12 WHERE id = @13""", 
    substitutionValues: {
      '1': data.title,
      '2': data.statut,
      '3': data.signature,
      '4': data.createdRef,
      '5': data.created,
      '6': data.isSubmit,
      '7': data.approbationDG,
      '8': data.motifDG,
      '9': data.signatureDG,
      '10': data.approbationDD,
      '11': data.motifDD,
      '12': data.signatureDD,
      '13': data.id
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

  Future<BalanceCompteModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return BalanceCompteModel(
      id: data[0][0],
      title: data[0][1],
      statut: data[0][2],
      signature: data[0][3],
      createdRef: data[0][4],
      created: data[0][5],
      isSubmit: data[0][6],
      approbationDG: data[0][7],
      motifDG: data[0][8],
      signatureDG: data[0][9],
      approbationDD: data[0][10],
      motifDD: data[0][11],
      signatureDD: data[0][12]
    );
  } 
}