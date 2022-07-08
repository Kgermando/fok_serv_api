import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/campaign_model.dart';

class CampaignRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  CampaignRepository(this.executor, this.tableName);


  Future<List<CampaignModel>> getAllData() async {
    var data = <CampaignModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(CampaignModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(CampaignModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
        "INSERT INTO $tableName (id, type_produit, date_debut_et_fin,"
        "cout_campaign, lieu_cible, promotion, objectifs,"
        "observation,  signature, created_ref, created,"
        "approbation_dg, motif_dg, signature_dg, approbation_budget, motif_budget, signature_budget,"
        "approbation_fin, motif_fin, signature_fin, approbation_dd, motif_dd, signature_dd,"
        "ligne_budgetaire, ressource)"
        "VALUES (nextval('campaigns_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19,"
        "@20, @21, @22, @23, @24)",
        substitutionValues: {
          '1': data.typeProduit,
          '2': data.dateDebutEtFin,
          '3': data.coutCampaign,
          '4': data.lieuCible,
          '5': data.promotion,
          '6': data.objectifs,
          '7': data.observation,
          '8': data.signature,
          '9': data.createdRef,
          '10': data.created,
          '11': data.approbationDG,
          '12': data.motifDG,
          '13': data.signatureDG,
          '14': data.approbationBudget,
          '15': data.motifBudget,
          '16': data.signatureBudget,
          '17': data.approbationFin,
          '18': data.motifFin,
          '19': data.signatureFin,
          '20': data.approbationDD,
          '21': data.motifDD,
          '22': data.signatureDD,
          '23': data.ligneBudgetaire,
          '24': data.ressource
        }
      );
    });
  }

  Future<void> update(CampaignModel data) async {
    await executor.query("""UPDATE $tableName
      SET type_produit = @1, date_debut_et_fin = @2, cout_campaign = @3
      lieu_cible = @4, promotion = @5, objectifs = @6, observation = @7,
      signature = @8, created_ref = @9, created = @10, 
      approbation_dg = @11', motif_dg = @12', signature_dg = @13', approbation_budget = @14',
      motif_budget = @15', signature_budget = @16', approbation_fin = @17', motif_fin = @18',
      signature_fin = @19', approbation_dd = @20', motif_dd = @21', signature_dd = @22',
      ligne_budgetaire = @23', ressource = @24' WHERE id = @25""",
        substitutionValues: {
          '1': data.typeProduit,
          '2': data.dateDebutEtFin,
          '3': data.coutCampaign,
          '4': data.lieuCible,
          '5': data.promotion,
          '6': data.objectifs,
          '7': data.observation,
          '8': data.signature,
          '9': data.createdRef,
          '10': data.created,
          '11': data.approbationDG,
          '12': data.motifDG,
          '13': data.signatureDG,
          '14': data.approbationBudget,
          '15': data.motifBudget,
          '16': data.signatureBudget,
          '17': data.approbationFin,
          '18': data.motifFin,
          '19': data.signatureFin,
          '20': data.approbationDD,
          '21': data.motifDD,
          '22': data.signatureDD,
          '23': data.ligneBudgetaire,
          '24': data.ressource,
          '25': data.id
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

  Future<CampaignModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CampaignModel(
      id: data[0][0],
      typeProduit: data[0][1],
      dateDebutEtFin: data[0][2],
      coutCampaign: data[0][3],
      lieuCible: data[0][4],
      promotion: data[0][5],
      objectifs: data[0][6],
      observation: data[0][7],
      signature: data[0][8],
      createdRef: data[0][9],
      created: data[0][10],
      approbationDG: data[0][11],
      motifDG: data[0][12],
      signatureDG: data[0][13],
      approbationBudget: data[0][14],
      motifBudget: data[0][15],
      signatureBudget: data[0][16],
      approbationFin: data[0][17],
      motifFin: data[0][18],
      signatureFin: data[0][19],
      approbationDD: data[0][20],
      motifDD: data[0][21],
      signatureDD: data[0][22],
      ligneBudgetaire: data[0][23],
      ressource: data[0][24]
    );
  } 
}