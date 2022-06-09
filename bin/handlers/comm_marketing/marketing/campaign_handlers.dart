import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/campaign_model.dart';
import '../../../repository/repository.dart';

class CampaignHandlers {
  final Repository repos;

  CampaignHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CampaignModel> data = await repos.campaigns.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CampaignModel data;
      try {
        data = await repos.campaigns.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-campaign', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      CampaignModel data = CampaignModel(
        typeProduit: input['typeProduit'],
        dateDebutEtFin: input['dateDebutEtFin'],
        coutCampaign: input['coutCampaign'],
        lieuCible: input['lieuCible'],
        promotion: input['promotion'],
        objectifs: input['objectifs'],
        observation: input['observation'],
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.campaigns.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-campaign/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CampaignModel data = await repos.campaigns.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['typeProduit'] != null) {
        data.typeProduit = input['typeProduit'];
      }
      if (input['dateDebutEtFin'] != null) {
        data.dateDebutEtFin = input['dateDebutEtFin'];
      }
      if (input['coutCampaign'] != null) {
        data.coutCampaign = input['coutCampaign'];
      }
      if (input['lieuCible'] != null) {
        data.lieuCible = input['lieuCible'];
      }
      if (input['promotion'] != null) {
        data.promotion = input['promotion'];
      }
      if (input['objectifs'] != null) {
        data.objectifs = input['objectifs'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.campaigns.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-campaign/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.campaigns.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page campaigns n\'est pas trouvé'),
    );

    return router;
  }
}
