import 'package:postgres/postgres.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/devis/devis_models.dart';

class DevisRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DevisRepository(this.executor, this.tableName);


  Future<List<DevisModel>> getAllData() async {
    var data = <DevisModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(DevisModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<List<PieChartModel>> getDepartementChartPieMounth() async {
    try {
      var data = <PieChartModel>{};
    var querySQL =
          "SELECT departement, COUNT(departement) FROM $tableName WHERE \"created\" >= NOW() - '1 mons' :: INTERVAL  GROUP BY \"departement\";";
      // var querySQL =
      //     "SELECT departement, COUNT(departement) FROM $tableName GROUP BY \"departement\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  Future<List<PieChartModel>> getDepartementChartPieYear() async {
    try {
      var data = <PieChartModel>{};
      var querySQL =
          "SELECT departement, COUNT(departement) FROM $tableName WHERE \"created\" >= NOW() - '1 years' :: INTERVAL  GROUP BY \"departement\";";
      // var querySQL =
      //     "SELECT departement, COUNT(departement) FROM $tableName GROUP BY \"departement\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(PieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw PieChartModel;
    }
  }

  Future<void> insertData(DevisModel data) async {
    await executor.transaction((ctx) async {
      await ctx.query(
          "INSERT INTO $tableName (id, title, priority,"
          "departement, observation,"
          "signature, created_ref, created, is_submit,"
          "approbation_dg, motif_dg, signature_dg, approbation_budget, motif_budget, signature_budget,"
          "approbation_fin, motif_fin, signature_fin, approbation_dd, motif_dd, signature_dd,"
          "ligne_budgetaire, ressource)"
          "VALUES (nextval('devis_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9,"
          "@10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21, @22)",
          substitutionValues: {
            '1': data.title,
            '2': data.priority,
            '3': data.departement,
            '4': data.observation,
            '5': data.signature,
            '6': data.createdRef,
            '7': data.created,
            '8': data.isSubmit,
            '9': data.approbationDG,
            '10': data.motifDG,
            '11': data.signatureDG,
            '12': data.approbationBudget,
            '13': data.motifBudget,
            '14': data.signatureBudget,
            '15': data.approbationFin,
            '16': data.motifFin,
            '17': data.signatureFin,
            '18': data.approbationDD,
            '19': data.motifDD,
            '20': data.signatureDD,
            '21': data.ligneBudgetaire,
            '22': data.ressource
          });
    });
  }

  Future<void> update(DevisModel data) async {
    await executor.query("""UPDATE $tableName
      SET title = @1, priority = @2, departement = @3, observation = @4,
      signature = @5, created_ref = @6, created = @7, is_submit = @8,
      approbation_dg = @9, motif_dg = @10, signature_dg = @11, approbation_budget = @12,
      motif_budget = @13, signature_budget = @14, approbation_fin = @15, motif_fin = @16,
      signature_fin = @17, approbation_dd = @18, motif_dd = @19, signature_dd = @20,
      ligne_budgetaire = @21, ressource = @22 WHERE id = @23""",
        substitutionValues: {
          '1': data.title,
          '2': data.priority,
          '3': data.departement,
          '4': data.observation,
          '5': data.signature,
          '6': data.createdRef,
          '7': data.created,
          '8': data.isSubmit,
          '9': data.approbationDG,
          '10': data.motifDG,
          '11': data.signatureDG,
          '12': data.approbationBudget,
          '13': data.motifBudget,
          '14': data.signatureBudget,
          '15': data.approbationFin,
          '16': data.motifFin,
          '17': data.signatureFin,
          '18': data.approbationDD,
          '19': data.motifDD,
          '20': data.signatureDD,
          '21': data.ligneBudgetaire,
          '22': data.ressource,
          '23': data.id
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

  Future<DevisModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return DevisModel(
      id: data[0][0],
      title: data[0][1],
      priority: data[0][2],
      departement: data[0][3],
      observation: data[0][4],
      signature: data[0][5],
      createdRef: data[0][6],
      created: data[0][7],
      isSubmit: data[0][8],
      approbationDG: data[0][9],
      motifDG: data[0][10],
      signatureDG: data[0][11],
      approbationBudget: data[0][12],
      motifBudget: data[0][13],
      signatureBudget: data[0][14],
      approbationFin: data[0][15],
      motifFin: data[0][16],
      signatureFin: data[0][17],
      approbationDD: data[0][18],
      motifDD: data[0][19],
      signatureDD: data[0][20],
      ligneBudgetaire: data[0][21],
      ressource: data[0][22]
    );
  } 
}