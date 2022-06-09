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
        "observation,  signature, created_ref, created)"
        "VALUES (nextval('campaigns_id_seq'), @1, @2, @3, @4, @5, @6,"
        "@7, @8, @9, @10)",
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
          '10': data.created
        }
      );
    });
  }

  Future<void> update(CampaignModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET type_produit = @1, date_debut_et_fin = @2, cout_campaign = @3"
          "lieu_cible = @4, promotion = @5, objectifs = @6, observation = @7,"
          "signature = @8, created_ref = @9, created = @10 WHERE id = @11",
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
            '11': data.id
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
      coutCampaign: data[0][3],
      lieuCible: data[0][4],
      promotion: data[0][5],
      objectifs: data[0][6],
      observation: data[0][7],
      signature: data[0][8],
      createdRef: data[0][8],
      created: data[0][10]
    );
  } 
}