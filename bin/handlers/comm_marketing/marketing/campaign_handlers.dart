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
        agentAffectes: input['agentAffectes'],
        coutCampaign: input['coutCampaign'],
        lieuCible: input['lieuCible'],
        promotion: input['promotion'],
        objetctifs: input['objetctifs'],
        ligneBudgtaire: input['ligneBudgtaire'],
        resources: input['resources'],
        approbationDG: input['approbationDG'],
        signatureDG: input['signatureDG'],
        signatureJustificationDG: input['signatureJustificationDG'],
        approbationFin: input['approbationFin'],
        signatureFin: input['signatureFin'],
        signatureJustificationFin: input['signatureJustificationFin'],
        approbationBudget: input['approbationBudget'],
        signatureBudget: input['signatureBudget'],
        signatureJustificationBudget: input['signatureJustificationBudget'],
        approbationDD: input['approbationDD'],
        signatureDD: input['signatureDD'],
        signatureJustificationDD: input['signatureJustificationDD'],
        signature: input['signature'],
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
      if (input['agentAffectes'] != null) {
        data.agentAffectes = input['agentAffectes'];
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
      if (input['objetctifs'] != null) {
        data.objetctifs = input['objetctifs'];
      }
      if (input['ligneBudgtaire'] != null) {
        data.ligneBudgtaire = input['ligneBudgtaire'];
      }
      if (input['resources'] != null) {
        data.resources = input['resources'];
      }
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.campaigns.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-campaign/<id>', (String id, Request request) async {
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