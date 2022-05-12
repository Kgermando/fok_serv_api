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

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

    var signature = data.signature;
    var created = data.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('campaigns_id_seq'), '$typeProduit',"
        "'$dateDebutEtFin','$agentAffectes','$coutCampaign', '$lieuCible', '$promotion',"
        "'$objetctifs', '$ligneBudgtaire', '$resources', '$observation',"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD',"
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

    var approbationDG = data.approbationDG;
    var signatureDG = data.signatureDG;
    var signatureJustificationDG =
        data.signatureJustificationDG;

    var approbationFin = data.approbationFin;
    var signatureFin = data.signatureFin;
    var signatureJustificationFin = data.signatureJustificationFin;

    var approbationBudget = data.approbationBudget;
    var signatureBudget = data.signatureBudget;
    var signatureJustificationBudget =
        data.signatureJustificationBudget;

    var approbationDD = data.approbationDD;
    var signatureDD = data.signatureDD;
    var signatureJustificationDD =
        data.signatureJustificationDD;

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
          "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
          "\"signatureJustificationDG\"='$signatureJustificationDG',"
          "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
          "\"signatureJustificationFin\"='$signatureJustificationFin',"
          "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
          "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
          "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
          "\"signatureJustificationDD\"='$signatureJustificationDD',"
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
      approbationDG: data[0][11],
      signatureDG: data[0][12],
      signatureJustificationDG: data[0][13],
      approbationFin: data[0][14],
      signatureFin: data[0][15],
      signatureJustificationFin: data[0][16],
      approbationBudget: data[0][17],
      signatureBudget: data[0][18],
      signatureJustificationBudget: data[0][19],
      approbationDD: data[0][20],
      signatureDD: data[0][21],
      signatureJustificationDD: data[0][22],
      signature: data[0][23],
      created: data[0][24]
    );
  } 
}