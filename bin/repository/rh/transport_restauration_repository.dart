import 'package:postgres/postgres.dart';

import '../../models/rh/transport_restauration_model.dart';

class TasnportRestaurationRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  TasnportRestaurationRepository(this.executor, this.tableName);

  Future<List<TransportRestaurationModel>> getAllData() async {
    var data = <TransportRestaurationModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(TransportRestaurationModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(TransportRestaurationModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, title, observation,"
          "signature, created_ref, created," 
          "approbation_dg, motif_dg, signature_dg, approbation_budget, motif_budget, signature_budget,"
          "approbation_fin, motif_fin, signature_fin, approbation_dd, motif_dd, signature_dd,"
          "ligne_budgetaire, ressource, is_submit)"
          "VALUES (nextval('transport_restaurations_id_seq'), @1, @2, @3, @4, @5,"
          "@6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20)",
          substitutionValues: {
            '1': data.title,
            '2': data.observation,
            '3': data.signature,
            '4': data.createdRef,
            '5': data.created,
            '6': data.approbationDG,
            '7': data.motifDG,
            '8': data.signatureDG,
            '9': data.approbationBudget,
            '10': data.motifBudget,
            '11': data.signatureBudget,
            '12': data.approbationFin,
            '13': data.motifFin,
            '14': data.signatureFin,
            '15': data.approbationDD,
            '16': data.motifDD,
            '17': data.signatureDD,
            '18': data.ligneBudgetaire,
            '19': data.ressource,
            '20': data.isSubmit
          });
    });
  }

  Future<void> update(TransportRestaurationModel data) async {
    await executor.query("""UPDATE $tableName
    SET title = @1, observation = @2, signature = @3, created_ref = @4, created = @5, 
    approbation_dg = @6, motif_dg = @7, signature_dg = @8, approbation_budget = @9,
    motif_budget = @10, signature_budget = @11, approbation_fin = @12, motif_fin = @13,
    signature_fin = @14, approbation_dd = @15, motif_dd = @16, signature_dd = @17,
    ligne_budgetaire = @18, ressource = @19, is_submit = @20 WHERE id = @21""", 
    substitutionValues: {
      '1': data.title,
      '2': data.observation,
      '3': data.signature,
      '4': data.createdRef,
      '5': data.created,
      '6': data.approbationDG,
      '7': data.motifDG,
      '8': data.signatureDG,
      '9': data.approbationBudget,
      '10': data.motifBudget,
      '11': data.signatureBudget,
      '12': data.approbationFin,
      '13': data.motifFin,
      '14': data.signatureFin,
      '15': data.approbationDD,
      '16': data.motifDD,
      '17': data.signatureDD,
      '18': data.ligneBudgetaire,
      '19': data.ressource,
      '20': data.isSubmit,
      '21': data.id
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

  Future<TransportRestaurationModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return TransportRestaurationModel(
        id: data[0][0],
        title: data[0][1],
        observation: data[0][2],
        signature: data[0][3],
        createdRef: data[0][4],
        created: data[0][5],
        approbationDG:  data[0][6],
        motifDG:  data[0][7],
        signatureDG:  data[0][8],
        approbationBudget:  data[0][9],
        motifBudget:  data[0][10],
        signatureBudget:  data[0][11],
        approbationFin:  data[0][12],
        motifFin:  data[0][13],
        signatureFin:  data[0][14],
        approbationDD:  data[0][15],
        motifDD:  data[0][16],
        signatureDD:  data[0][17],
        ligneBudgetaire:  data[0][18],
        ressource:  data[0][19],
        isSubmit: data[0][20]
    );
  }

}