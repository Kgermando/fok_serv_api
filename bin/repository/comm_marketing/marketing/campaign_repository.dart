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
        "agent_affectes, cout_campaign, lieu_cible, promotion, objetctifs,"
        "ligne_budgtaire,  resources,  observation,  signature, created)"
        "VALUES (nextval('campaigns_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10, @11, @12)",
        substitutionValues: {
          '1': data.typeProduit,
          '2': data.dateDebutEtFin,
          '3': data.agentAffectes,
          '4': data.coutCampaign,
          '5': data.lieuCible,
          '6': data.promotion,
          '7': data.objetctifs,
          '8': data.ligneBudgtaire,
          '9': data.resources,
          '10': data.observation,
          '11': data.signature,
          '12': data.created
        }
      );
    });
  }

  Future<void> update(CampaignModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET type_produit = @1, date_debut_et_fin = @2, agent_affectes = @3,"
          "cout_campaign = @4, lieu_cible = @5, promotion = @6, objetctifs = @7,"
          "ligne_budgtaire = @8, resources = @9, observation = @10,"
          "signature = @11, created = @12 WHERE id = @13",
          substitutionValues: {
            '1': data.typeProduit,
            '2': data.dateDebutEtFin,
            '3': data.agentAffectes,
            '4': data.coutCampaign,
            '5': data.lieuCible,
            '6': data.promotion,
            '7': data.objetctifs,
            '8': data.ligneBudgtaire,
            '9': data.resources,
            '10': data.observation,
            '11': data.signature,
            '12': data.created,
            '13': data.id
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

  Future<CampaignModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return CampaignModel(
      id: data[0][0],
      typeProduit: data[0][1],
      dateDebutEtFin: data[0][2],
      agentAffectes: data[0][3],
      coutCampaign: data[0][4],
      lieuCible: data[0][5],
      promotion: data[0][6],
      objetctifs: data[0][7],
      ligneBudgtaire: data[0][8],
      resources: data[0][9],
      observation: data[0][10],
      signature: data[0][11],
      created: data[0][12]
    );
  } 
}