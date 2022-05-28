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
    var typeProduit = data.typeProduit;
    var dateDebutEtFin = data.dateDebutEtFin;
    var agentAffectes = data.agentAffectes;
    var coutCampaign = data.coutCampaign;
    var lieuCible = data.lieuCible;
    var promotion = data.promotion;
    var objetctifs = data.objetctifs;
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;
    var observation = data.observation;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('campaigns_id_seq'), '$typeProduit',"
        "'$dateDebutEtFin','$agentAffectes','$coutCampaign', '$lieuCible', '$promotion',"
        "'$objetctifs', '$ligneBudgtaire', '$resources', '$observation',"
        "'$signature','$created');");
    });
  }

  Future<void> update(CampaignModel data) async {
    var id = data.id;
    var typeProduit = data.typeProduit;
    var dateDebutEtFin = data.dateDebutEtFin;
    var agentAffectes = data.agentAffectes;
    var coutCampaign = data.coutCampaign;
    var lieuCible = data.lieuCible;
    var promotion = data.promotion;
    var objetctifs = data.objetctifs;
    var ligneBudgtaire = data.ligneBudgtaire;
    var resources = data.resources;
    var observation = data.observation;
    var signature = data.signature;
    var created = data.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
          "UPDATE $tableName SET \"typeProduit\"='$typeProduit', "
          "\"dateDebutEtFin\"='$dateDebutEtFin',\"agentAffectes\"='$agentAffectes',"
          "\"coutCampaign\"='$coutCampaign', \"lieuCible\"='$lieuCible', \"promotion\"='$promotion',"
          "\"objetctifs\"='$objetctifs', \"ligneBudgtaire\"='$ligneBudgtaire', \"resources\"='$resources',"
          "\"observation\"='$observation',"
          "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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